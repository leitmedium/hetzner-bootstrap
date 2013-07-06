#!/bin/bash

echo
echo "Hetzner Bootstrap"
echo

BRANCH=$(git rev-parse --abbrev-ref HEAD)
REMOTE=$(git ls-remote --get-url origin | sed 's,github\.com[:/],raw.github.com/,;s,^git@,https://,;s,\.git$,,')
BASE_URL=$REMOTE/$BRANCH
echo "Base-URL: $BASE_URL"

sed "s,%%BASE_URL%%,${BASE_URL},g" hetzner-installimage.sh.template > hetzner-installimage.sh
sed "s,%%BASE_URL%%,${BASE_URL},g" hetzner-postinstall.sh.template > hetzner-postinstall.sh
cat custom-postinstall.sh >> hetzner-postinstall.sh

echo
echo "Please provide a space-separated list of github users whose"
echo "ssh public keys you want to add to /root/ssh/.authorized_keys"
echo "Leave blank if you don't want to grab keys from github."
echo "Example: leitmedium ctavan"
read ROOT_USERS

for USER in $ROOT_USERS
do
    wget -qO - https://api.github.com/users/$USER/keys |
        grep -Po '"key": "\K[^"]+' |
        awk -v user=$USER '{print $0, user}' >> root-ssh-authorizedkeys.pub
done

echo
echo "After pushing the new files to github you should be able to set up"
echo "a new server from the console by running the following command from"
echo "rescue mode (think twice before eventually losing data):"
echo
echo "SERVERNAME=your.fully.qualified.server.name bash < <(wget -qO - ${BASE_URL}/hetzner-installimage.sh)" | tee install-command.txt
echo
