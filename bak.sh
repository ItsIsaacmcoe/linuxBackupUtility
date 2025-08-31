#!/usr/bin/env bash

#exit on command failure, handle undefined variables, pipeline error on any fail
set -euo pipefail

#source variable from config
source bak.cfg

#Ciphertext name
cName=$(date +"backup-%m-%d.tar.gpg")

#create local backup directory if needed
if [ ! -d $lDir ]; then
	mkdir $lDir
fi

#Try local Backup, clean up and exit on fail
if sudo tar -zcpC / -T $bList | gpg --trust-model always --yes -er $key > "$lDir$cName" ; then
	res="Local:️✅ "
else
	rm $lDir/$cName
	echo "Local:❌ "
	exit 1
fi

#Copy local Backup to remote directories
for rpath in ${rDirs[@]}; do
	if [ -d $rpath ]; then
		cp "$lDir$cName" "$rpath$cName" && res=$res$rpath": ✅ "
	else
		res=$res$rpath":❌ not found "
	fi
done

#Log output
(date; echo $res) | sudo tee -a /var/log/backupUtility.log