#!/bin/bash

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

#Tar and encrypt document backup
sudo tar -zcpC / -T $bList | gpg --trust-model always --yes -er $key > "$dir/$dBakName" && res="Local:️✅ "

#detect and copy to sd card
if [ -d $rDriv ]; then
	cp "$dir/$dBakName" "$rDriv/Backups/$dBakName" && res=$res"SD:️✅ "
else
	res=$res"SD:❌ "
fi

date | sudo tee -a /var/log/backupUtility.log
echo $res | sudo tee -a /var/log/backupUtility.log

#To add: detect when a dedicated sym-encrypted drive is attatched. Rsync VM files if detected.