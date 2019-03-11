Veeam Agent for Linux puppet module
-----------------------------------

## Table of Contents

1. [Overview](#overview)
2. [Module description - What the module does and why it is useful](#module-description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Advanced features - Extra information on advanced usage](#advanced-features)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Support - When you need help with this module](#support)

## Overview

This module manages Veeam Agent for Linux. Veeam Agent for Linux is an agent-based solution running inside the guest OS (operating system). For more information check [the official Veeam website](https://www.veeam.com/linux-cloud-server-backup-agent.html).

The following is currently supported:
  - Create a repository (Veeam Backup & Replication repository, local, NFS or CIFS)
  - Create a backup job (entire computer or volume based)
  - Configure the license mode (free, workstation or server)
  - Define the schedule (cron based)

> **Note:**

> This is an example module and can be modified as you want. Please test it in a development environment before running directly in production.
  
## Module description

The Veeam Agent for Linux module deploys the agent on multiple nodes with the specified configuration.

## Requirements

For usage on Apt based distro's the [apt module](https://forge.puppet.com/puppetlabs/apt) is required.
For usage on Yum based distro's [yumrepo](https://docs.puppet.com/puppet/latest/types/yumrepo.html) is being used (installed by default). 

## Usage

When the license is being handled by Veeam Backup & Replication no additional license configuration is needed. If the license is however managed per device place your license file in the files folder under the module or disable license management via the module.

### Install with the default settings

```puppet
 class { 'veeam_val':
   
  }
```

### Install with specific settings

```puppet
 class { 'veeam_val':
    setup        => true,
    target       => 'cifs',
    cifsserver   => '192.168.1.120',
    cifspath     => '\\somepath',
    username     => 'cifslogin',
    password     => 'veeamiscool123',
    reponame	 => 'backuprepository',
    repopath     => '/data/backup',
    jobname 	 => 'backupjob_puppet',
    objects		 => '/dev/sda',
    license      => 'workstation',
  }
```

More examples are provided in the [examples](https://github.com/nielsengelen/val-puppet/tree/master/examples) folder.

### Advanced features

```puppet
 class { 'veeam_val':
        setup         => true or false (required for advanced setup)

        epel_manage   => Add epel repository true or false (DEFAULT: true)
        target        => Local, CIFS, NFS, vbrserver (DEFAULT: local)
        reponame      => Repository name (DEFAULT: VeeamRepository)
        repopath      => Repository path (DEFAULT: /data/VeeamBackup)

        cifsserver    => CIFS FQDN/IP (DEFAULT: none)
        cifspath      => CIFS share path (DEFAULT: none)
        nfsserver     => NFS FQDN/IP (DEFAULT: none)
        nfspath       => NFS share path (DEFAULT: none)
        vbrname       => Veeam Backup & Replication name (DEFAULT: none)
        vbrserver     => Veeam Backup & Replication FQDN/IP (DEFAULT: none)
        vbrserverport => Veeam Backup & Replication port (DEFAULT: 10002)

        domain        => Domain or hostname (DEFAULT: none)
        username      => Login for target authentication (DEFAULT: none)
        password      => Password for target authentication (DEFAULT: none)

        type          => Entire or volume (DEFAULT: volume)
        jobname       => Job name (DEFAULT: VeeamBackupJob)
        blocksize     => 256|512|1024|4096 (DEFAULT: 4096)
        compression   => 0 ... 4 (DEFAULT: 1)
        objects       => Objects to backup comma seperated (DEFAULT: /dev/sda)
        points        => 5 (DEFAULT: 7)

        postjob       => Postjob script path (DEFAULT: none)

        license       => Server or workstation (DEFAULT: none)
  }
```

## Limitations

This module has been built on and tested against Puppet 4.x. 

The module has been tested on:

* Debian 6/7/8
* CentOS 6/7
* Ubuntu 12.04, 14.04, 16.04
* Fedora Core 23/24

Testing on other platforms has not yet been performed.

## Development

Please contact Niels Engelen via [twitter](https://twitter.com/nielsengelen).

## Support

Need help? Join us on the [discussion forum](https://forums.veeam.com/veeam-agent-for-linux-f41/).

## Todo

> - Add support for SLES/SuSE.

## Distributed under MIT license
Copyright (c) 2016 VeeamHub

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
