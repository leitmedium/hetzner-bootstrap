#!/bin/bash
apt-get -y install byobu wget
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/leitmedium/hetzner-bootstrap/raid1-fulldisk-puppet/root-ssh-authorizedkeys.pub
bash < <(wget -qO - https://bit.ly/install-puppet-agent)
