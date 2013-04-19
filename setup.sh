#!/bin/bash

# base url
echo " please give the base url, where wget can access your hetzner-install.sh script"
echo " e.g.: https://www.example.com/scripts/"
read BASE_URL

sed "s/%%BASE_URL%%/${BASE_URL}/g" hetzner-installimage.sh.template > hetzner-installimage.sh
sed "s/%%BASE_URL%%/${BASE_URL}/g" hetzner-postinstall.sh.template > hetzner-postinstall.sh
cat custom-postinstall.sh >> hetzner-postinstall.sh


echo " you should be able to setup a new server from the console by running"
echo " the following command from rescue mode (think twice before eventually losing data):"
echo ""
echo "SERVERNAME=your.fully.qualified.server.name bash < <(wget -qO - ${BASE_URL}/hetzner-installimage.sh)" | tee install-command.txt
echo ""
