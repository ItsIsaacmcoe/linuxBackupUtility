#!/usr/bin/env bash

#exit on command failure, undefined var and make pipeline exit codes equal to any failure
set -euo pipefail

#source variable from config
source bak.cfg

#create local backup directory if needed
if [ ! -d $dir ]; then
	mkdir $dir
fi

#Try local Backup, remove empty output on failure
if sudo tar -zcpC / -T $bList | gpg --trust-model always --yes -er $key > "$dir/$dBakName" ; then
	res="Local:️✅ "
else
	rm $dir/$dBakName
	echo "Local:❌ "
	exit 1
fi

#detect and copy to sd card, make modular
if [ -d $rDriv ]; then
	cp "$dir/$dBakName" "$rDriv/Backups/$dBakName" && res=$res"SD:️✅ "
else
	res=$res"SD:❌ "
fi

(date; echo $res) | sudo tee -a /var/log/backupUtility.log