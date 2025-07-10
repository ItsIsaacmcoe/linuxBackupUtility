#!/bin/sh

#Check for superuser privileges
if ! sudo -v; then
    echo "Failed to get sudo access. Exiting."
    exit 1
fi

#Local copy
dir="{directory}"

#Flash storage copy
rDriv="{directory}"

#Target file list
bList="{.txt}"

#Pubkey
key="{gpg pubkey in local keyring}"

#Ciphertext name
dBakName=$(date +"laptop-%m-%d.tar.gpg")

#results assume failure
res="Local:️❌ "

#check for presence of backup list to prevent error on tar failure
if [ -f $bList ]; then
	#Tar and encrypt document backup
	sudo tar -zcpC / -T $bList | gpg --trust-model always --yes -er $key > "$dir/$dBakName" && res="Local:️✅ "
else
	echo 'File list not found. Exiting'
	exit 1
fi

#detect and copy to sd card
if [ -d $rDriv ]; then
	cp "$dir/$dBakName" "$rDriv/Backups/$dBakName" && res=$res"SD:️✅ "
else
	res=$res"SD:❌ "
fi

(date; echo $res) | sudo tee -a /var/log/backupUtility.log