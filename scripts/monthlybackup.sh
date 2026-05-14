#!/bin/bash

if [[ -e ~/.last_backup ]]
then
	echo "Last backup:" $(cat ~/.last_backup)
fi

drive=$(lsblk -l | tac | fzf | cut -d ' ' -f1)
sudo mount /dev/$drive /run/mount/
sudo rsync -av --delete ~/ /run/mount/backup/home/
sudo rsync -av --delete /etc/ /run/mount/backup/etc/
sudo rsync -av --delete /usr/ /run/mount/backup/usr/
sudo umount /dev/$drive

echo "Backup complete!"
echo $(date "+%Y.%m.%d. (%a) %H:%M") > ~/.last_backup
