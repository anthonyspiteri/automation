# Class: veeam_val::install
#
# This class provides the main installation.
#
# = Author
#
# Niels Engelen <niels@foonet.be>
#
class veeam_val::install {
  # Get all packages installed properly
  $epel_manage = $::veeam_val::epel_manage
  $pkg_name   = $veeam_val::pkg_name
  $pkg_ensure = $veeam_val::pkg_ensure

  case $::operatingsystem {
    'CentOS', 'Fedora', 'RedHat': {
      if ($::operatingsystem == 'Fedora') {
        $pkg_os_suffix = 'fc'

        case $::operatingsystemrelease {
          /^23\./: {
            $osversion = 23
          }
          /^24\./: {
            $osversion = 24
          }
          default: {
            $osversion = 24
          }
        }
      } else {
        $pkg_os_suffix = 'el'

        case $::operatingsystemrelease {
          /^6\./: {
            $osversion = 6
          }
          /^7\./: {
            $osversion = 7
          }
          default: {
            $osversion = 7
          }
        }
      }

      # A yum repository for RHEL based servers
      file { '/etc/yum.repos.d/':
        ensure => 'directory',
        mode   => '0755',
      }

      if ( $epel_manage ) {
          yumrepo { 'epel':
              mirrorlist     => "https://mirrors.fedoraproject.org/metalink?repo=epel-${osversion}&arch=${::architecture}",
              descr          => 'Extra Packages for Enterprise Linux',
              enabled        => 1,
              gpgcheck       => 0,
              failovermethod => 'priority',
          }
      }

      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-VeeamSoftwareRepo':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/veeam_val/RPM-GPG-KEY-VeeamSoftwareRepo',
      } ->

      file { '/etc/pki/rpm-gpg/VeeamSoftwareRepo':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/veeam_val/VeeamSoftwareRepo',
      } ->

      yumrepo { 'veeam':
        descr    => 'Veeam Backup for GNU/Linux - $basearch',
        baseurl  => "http://repository.veeam.com/backup/linux/agent/rpm/${pkg_os_suffix}/${osversion}/${::architecture}",
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'http://repository.veeam.com/keys/RPM-GPG-KEY-VeeamSoftwareRepo http://repository.veeam.com/keys/VeeamSoftwareRepo',
        before   => Package[$pkg_name],
      }
    }

    'Debian', 'Ubuntu': {
      include apt

      case $::architecture {
        'amd64': {
          $location = 'http://repository.veeam.com/backup/linux/agent/dpkg/debian/x86_64/'
        }
        default: {
          $location = "http://repository.veeam.com/backup/linux/agent/dpkg/debian/${::architecture}/"
        }
      }

      apt::source { 'veeam':
        comment      => 'This is the Veeam Agent for Linux mirror',
        architecture => $::architecture,
        key          => {
          id      => 'EFAFF6B44E6880EADDD217E47AFDEEB8FBF8A590',
          options => 'http://repository.veeam.com/keys/RPM-GPG-KEY-VeeamSoftwareRepo',
        },
        location     => $location,
        release      => 'noname',
        repos        => 'veeam',
        before       => Package[$pkg_name],
      }
    }

    default: {
      fail "Operating system (${::operatingsystem}) not (yet) supported in the Veeam Agent for Linux module."
    }
  }

  package { $pkg_name:
    ensure  => $pkg_ensure,
  }
}
