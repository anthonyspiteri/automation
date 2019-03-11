# === Class veeam_val::config
#
# = Author
#
# Niels Engelen <niels@foonet.be>
#
class veeam_val::config (
  $service_cmd     = $::veeam_val::service_cmd,
  $service_name    = $::veeam_val::service_name,
  $service_ensure  = $::veeam_val::service_ensure,

  $epel_manage     = $::veeam_val::epel_manage,

  $pkg_ensure      = $::veeam_val::pkg_ensure,
  $pkg_name        = $::veeam_val::pkg_name,

  $setup           = $::veeam_val::setup,

  $target          = $::veeam_val::target,
  $reponame        = $::veeam_val::reponame,
  $repopath        = $::veeam_val::repopath,

  $cifsserver      = $::veeam_val::cifsserver,
  $cifspath        = $::veeam_val::cifspath,
  $nfsserver       = $::veeam_val::nfsserver,
  $nfspath         = $::veeam_val::nfspath,
  $vbrname         = $::veeam_val::vbrname,
  $vbrserver       = $::veeam_val::vbrserver,
  $vbrserverport   = $::veeam_val::vbrserverport,

  $domain          = $::veeam_val::domain,
  $username        = $::veeam_val::username,
  $password        = $::veeam_val::password,

  $type            = $::veeam_val::type,
  $jobname         = $::veeam_val::jobname,
  $blocksize       = $::veeam_val::blocksize,
  $compression     = $::veeam_val::compression,
  $objects         = $::veeam_val::objects,
  $includedirs     = $::veeam_val::includedirs,
  $excludedirs     = $::veeam_val::excludedirs,
  $includemasks    = $::veeam_val::includemasks,
  $excludemasks    = $::veeam_val::excludemasks,
  $points          = $::veeam_val::points,

  $postjob         = $::veeam_val::postjob,
  $prejob          = $::veeam_val::prejob,

  $schedule        = $::veeam_val::schedule,
  $schedulecron    = $::veeam_val::schedulecron,

  $license         = $::veeam_val::license,
) {
  Exec { path => [ '/usr/bin/' ] }

  if $setup {
    if ($license != '' and $target != 'vbrserver') {
      # Configure the license
      file { '/usr/share/veeam/license.lic':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => 'puppet:///modules/veeam_val/license.lic',
        require => Package[$pkg_name],
        before  => Exec['install_license'],
      }

      exec { 'install_license':
        command => "${service_cmd} license install --${license} --path '/usr/share/veeam/license.lic'",
        unless  => "${service_cmd} license show | /bin/grep -c ${license}",
        before  => Exec['create_repository'],
      }
    }

    if $target == 'vbrserver' {
      # Add the Veeam Backup & Replication server
      exec { 'create_vbrserver':
        command => "${service_cmd} vbrserver add --name '${vbrname}' --address '${vbrserver}' --port '${vbrserverport}' --login '${username}' --domain '${domain}' --password '${password}'",
        unless  => "${service_cmd} vbrserver list | /bin/grep -c ${vbrname}",
      }

      # Create the backup job with the correct settings
      exec { 'create_job':
        command => "${service_cmd} job create --name '${jobname}' --repoName '${reponame}' --postjob '${postjob}' --prejob '${prejob}' --compressionLevel ${compression} --maxPoints ${points} --objects '${objects}'",
        unless  => "${service_cmd} job list | /bin/grep -c ${jobname}",
        require => Exec['create_vbrserver'],
      }
    } else {
      # Create the backup directory if not present
      # using exec as puppet can't make all missing dirs recursively
      exec { 'create_repository_path':
        command => "/bin/mkdir -p ${repopath}",
        creates => $repopath,
      }

      if ($target == 'cifs') {
        package { 'cifs-utils':
          ensure => latest,
        }

        file { '/etc/cifs':
          ensure => directory,
          mode   => '0700',
        }

        file { '/etc/cifs/.credsfile':
          ensure  => present,
          content => "username=${username}\npassword=${password}\ndomain=${domain}\n",
          mode    => '0600',
        }

        mount { $repopath:
          ensure  => 'mounted',
          device  => "//${cifsserver}${cifspath}",
          atboot  => true,
          fstype  => 'cifs',
          name    => $repopath,
          options => 'auto,credentials=/etc/cifs/.credsfile',
          require => [File['/etc/cifs/.credsfile'],Package['cifs-utils'],Exec['create_repository_path']],
        }
      }

      if ($target == 'nfs') {
        mount { $repopath:
          ensure  => 'mounted',
          device  => "${nfsserver}:${nfspath}",
          atboot  => true,
          fstype  => 'nfs',
          options => 'defaults',
          require => Exec['create_repository_path'],
        }
      }

      # Add the repository
      exec { 'create_repository':
        command => "${service_cmd} repository create --name '${reponame}' --location '${repopath}'",
        unless  => "${service_cmd} repository list | /bin/grep -c ${reponame}",
      }

      # Create the backup job with the correct settings
      if ($type == 'entire') {
        exec { 'create_job':
          command => "${service_cmd} job create --name '${jobname}' --repoName '${reponame}' --postjob '${postjob}' --prejob '${prejob}' --compressionLevel ${compression} --maxPoints ${points} --backupAllSystem'",
          unless  => "${service_cmd} job list | /bin/grep -c ${jobname}",
          require => Exec['create_repository'],
        }
      }
      elsif ($type == 'file') {
        exec { 'create_job':
          command => "${service_cmd} job create fileLevel --name '${jobname}' --repoName '${reponame}' --postjob '${postjob}' --prejob '${prejob}' --compressionLevel ${compression} --maxPoints ${points} --includeDirs '${includedirs}' --excludeDirs '${excludedirs}' --includeMasks \"${includeMasks}\" --excludeMasks \"${excludeMasks}\"",
          unless  => "${service_cmd} job list | /bin/grep -c ${jobname}",
          require => Exec['create_repository'],
        }
      }
      else {
        exec { 'create_job':
          command => "${service_cmd} job create --name '${jobname}' --repoName '${reponame}' --postjob '${postjob}' --prejob '${prejob}' --compressionLevel ${compression} --maxPoints ${points} --objects '${objects}'",
          unless  => "${service_cmd} job list | /bin/grep -c ${jobname}",
          require => Exec['create_repository'],
        }
      }
    }

    if $schedule {
      # Only create the cron file when the Veeam Agent for Linux is installed
      file { '/etc/cron.d/veeam.cron':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => [Package[$pkg_name],Exec['create_job']],
        content => "# Created by Puppet.\n${schedulecron} root ${service_cmd} job start --name '${jobname}' --retriable --highpriority\n";
      }
    }
  }
}
