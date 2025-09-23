#!/usr/bin/env bash

#Exit on command fail, undefined variables, pipeline error
set -euo pipefail

#Source custom variables
source "$(dirname "$0")/cfg/bak.cfg"

#Ciphertext name
cName=$(date +"$HOSTNAME-%m-%d.tar.gpg")

#Check that config file has been edited
if [ $lDir = "/path/to/primary/backup/directory/" ]; then
	echo 'Configure bak.cfg (replace placeholders)'
	exit 1
fi

#Create local backup directory if needed
if [ ! -d $lDir ]; then
	mkdir $lDir
fi

#Encrypt, Tar, clean up and exit if failed
if sudo tar -zcpC / -T $bList | gpg --trust-model always --yes -er $key > "$lDir$cName" ; then
	res="Local:️✅ "
else
	rm $lDir$cName
	echo "Local:❌ "
	exit 1
fi

#Copy local Backup to additional directories
for rpath in ${rDirs[@]}; do
	if [ -d $rpath ]; then
		cp "$lDir$cName" "$rpath$cName" && res=$res$rpath": ✅ "
	else
		res=$res$rpath":❌ not found "
	fi
done

#Log output
(date; echo $res) | sudo tee -a /var/log/backupUtility.log