# === Class veeam_val
#
# = Parameters
#   epel_manage   => Add epel repo (true,false)            (DEFAULT: true)
#   pkg_ensure    => Present, latest or absent             (DEFAULT: present)
#
#	target		  => Local, NFS, SMB, vbrserver            (DEFAULT: none)
#   reponame  	  => Repository name                       (DEFAULT: none)
#	repopath   	  => Repository path                       (DEFAULT: none)
#
#   setup         => Enable configuration after install    (DEFAULT: false)
#
#   cifsserver    => CIFS FQDN/IP                          (DEFAULT: none)
#   cifspath      => CIFS share path                       (DEFAULT: none)
#   nfsserver     => NFS FQDN/IP                           (DEFAULT: none)
#   nfspath       => NFS share path                        (DEFAULT: none)
#   vbrname       => Veeam Backup & Replication name       (DEFAULT: none)
#   vbrserver     => Veeam Backup & Replication FQDN/IP    (DEFAULT: none)
#   vbrserverport => Veeam Backup & Replication port       (DEFAULT: 10002)
#
#   domain        => Domain or hostname                    (DEFAULT: none)
#   username      => Login for target authentication       (DEFAULT: none)
#   password      => Password for target authentication    (DEFAULT: none)
#
#	type         => File, volume or entire                (DEFAULT: none)
#   jobname    => Job name                              (DEFAULT: none)
# 	blocksize  => 256|512|1024|4096                     (DEFAULT: 4096)
#	compression  => 0 ... 4                               (DEFAULT: 1)
#	objects      => Objects to backup comma seperated	   (DEFAULT: none)
# includedirs => Files to back up comma separated   (DEFAULT: none)
# excludedirs => Files to exclude from backup back up comma separated   (DEFAULT: none)
# includemasks => File masks to back up comma separated   (DEFAULT: none)
# excludemasks => File masks to exclude from backup comma separated   (DEFAULT: none)
#	points       => Number of restore points to keep      (DEFAULT: 7)
#
#   postjob  	  => Postjob script path                   (DEFAULT: none)
#   prejob        => Prejob script path                    (DEFAULT: none)
#
#   schedule      => Run the job on specific schedule      (DEFAULT: false)
#   schedulecron  => Cron format when to run the job       (DEFAULT: '0 0 * * *')
#
#   license       => Server or workstation                 (DEFAULT: none)
#
# = Examples
# Local backup target example
# node abc {
#  class { 'veeam_val':
#    setup       => true,
#    target      => 'local'
#  	 type        => 'volume',
#    reponame    => 'Backuprepo',
#  	 repopath    => '/data/backup',
#    jobname   	 => 'Backup_Job_To_Local',
#	 objects     => '/dev/sda1',
#    points		 => 14,
#	 postjob     => '/etc/veeam/myscriptdone.sh',
#	 prejob	     => '/etc/veeam/myscript.sh',
#  }
# }
#
# Veeam Backup & Replication repository example
# node abc {
#  class { 'veeam_val':
#    setup       => true,
#  	 type         => 'entire',
#    vbrname      => 'VBR',
#    vbrserver    => '10.0.0.1',
#    vbrdomain    => 'DOMAIN',
#    vbrlogin     => 'Veeam',
#    vbrpassword  => 'veeamisaweomse123',
#    reponame     => '[VBR]STORAGE',
#    jobname   	  => 'Backup_Job_To_VBR',
#  }
# }
#
# = Author
#
# Niels Engelen (niels@foonet.be)
#
class veeam_val (
  $epel_manage    = $::veeam_val::params::epel_manage,

  $pkg_ensure     = $::veeam_val::params::pkg_ensure,
  $pkg_name       = $::veeam_val::params::pkg_name,

  $service_cmd    = $::veeam_val::params::service_cmd,
  $service_name   = $::veeam_val::params::service_name,
  $service_ensure = $::veeam_val::params::service_ensure,

  $setup          = $::veeam_val::params::setup,

  $target         = $::veeam_val::params::target,
  $reponame       = $::veeam_val::params::reponame,
  $repopath       = $::veeam_val::params::repopath,

  $cifsserver     = $::veeam_val::params::cifsserver,
  $cifspath       = $::veeam_val::params::cifspath,
  $nfsserver      = $::veeam_val::params::nfsserver,
  $nfspath        = $::veeam_val::params::nfspath,
  $vbrname        = $::veeam_val::params::vbrname,
  $vbrserver      = $::veeam_val::params::vbrserver,
  $vbrserverport  = $::veeam_val::params::vbrserverport,

  $domain         = $::veeam_val::params::domain,
  $username       = $::veeam_val::params::username,
  $password       = $::veeam_val::params::password,

  $type           = $::veeam_val::params::type,
  $jobname        = $::veeam_val::params::jobname,
  $compression    = $::veeam_val::params::compression,
  $blocksize      = $::veeam_val::params::blocksize,
  $points         = $::veeam_val::params::points,
  $objects        = $::veeam_val::params::objects,
  $includedirs    = $::veeam_val::params::includedirs,
  $excludedirs    = $::veeam_val::params::excludedirs,
  $includemasks   = $::veeam_val::params::includemasks,
  $excludemasks   = $::veeam_val::params::excludemasks,

  $postjob        = $::veeam_val::params::postjob,
  $prejob         = $::veeam_val::params::prejob,

  $schedule       = $::veeam_val::params::schedule,
  $schedulecron   = $::veeam_val::params::schedulecron,

  $license        = $::veeam_val::params::license,
) inherits veeam_val::params {
  class{ 'veeam_val::install': } ->
  class{ 'veeam_val::config': } ->
  class{ 'veeam_val::service': } ->
  Class['veeam_val']
}
