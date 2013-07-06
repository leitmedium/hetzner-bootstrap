hetzner-bootstrap
=================

Script for fully automated Hetzner root server setup from rescue mode.

This script is only needed, when you are hosting root servers at hetzner
and want to (re-)setup a server. This version of the script assumes you
want to install Ubuntu 12.04 precise 64bit minimal and you want a
software raid 1, with a 1GB /boot ext3 and ext4 for the rest of your
disk. If that doesn't fit your needs, feel free to consult the
installimage documentation and patch `hetzner-installimage.sh.template`

**WARNING: the scripts in this package reformat your disks.**

Preparation:

1. Download/clone this repository

You can manage various installation profiles by simply creating different git
branches with different settings. For each profile just follow the steps below:

1. Create a git branch for the profile that you want to create
1. Add commands you want to be run by the post install script inside
   your freshly setup server into `custom-postinstall.sh`
1. Run `./setup.sh`
1. If you didn't choose to fetch ssh keys from github you can add one or more
   ssh public keys to `root-ssh-authorizedkeys.pub`.
1. Add and commit all files that were created or changed by `setup.sh` and push
   to github.
1. Use the command provided to setup new servers with this profile.

On the server you want to install:

1. Boot into rescue mode
1. Run the command provided by your `setup.sh`

If you are unsure what your current install command is, see
`install-command.txt`

License
-------

This software is published under the MIT License. See LICENSE for details.
