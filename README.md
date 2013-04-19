hetzner-bootstrap
=================

Script for fully automated Hetzner root server setup from rescue mode.

This script is only needed, when you are hosting root servers at hetzner
and want to (re-)setup a server. This version of the script assumes you
want to install Ubuntu 12.04 precise 64bit minimal and you want a
software raid 1, with a 1GB /boot ext3 and ext4 for the rest of your
disk. If that doesn't fit your needs, feel free to consult the
installimage documentation and patch hetzner-installimage.sh.template 

WARNING: the scripts in this package reformat your disks. 

on your web server:

1. download/clone this repository
2. put it into a directory on your web server
3. add commands you want to be run by the post install script inside
    your freshly setup server into custom-postinstall.sh 
4. add one or multiple ssh public keys to root-ssh-authorizedkeys.pub 
5. run "./setup.sh"
6. provie the base url of your web server script directory
7. use the command provided to setup new servers

on the server you want to install:

1. boot into rescue mode
2. run the command provided by your setup.sh

if you are unsere what your current install command is, see
 install-command.txt, that is writte, every time you run setup.sh
