#!/bin/bash
apt-get update
apt-get -y upgrade
apt-get -y install byobu wget ruby1.8 libxmlrpc-ruby libopenssl-ruby libshadow-ruby1.8 libaugeas-ruby1.8
wget http://apt.puppetlabs.com/pool/precise/main/f/facter/facter_1.7.3-1puppetlabs1_amd64.deb
wget http://apt.puppetlabs.com/pool/precise/main/p/puppet/puppet-common_2.7.23-1puppetlabs1_all.deb
wget http://apt.puppetlabs.com/pool/precise/main/p/puppet/puppet_2.7.23-1puppetlabs1_all.deb
dpkg -i facter_1.7.3-1puppetlabs1_amd64.deb
dpkg -i puppet-common_2.7.23-1puppetlabs1_all.deb
dpkg -i puppet_2.7.23-1puppetlabs1_all.deb
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/leitmedium/hetzner-bootstrap/mbr-basenode/root-ssh-authorizedkeys.pub
# please add you custom postinstall commands here
# you should keep in mind, that this script is run inside a chrooted
# envorinment of the freshly installed server, so every change here
# is a direct change in the new server
