#!/bin/bash
drive=$(lsblk -l | tac | fzf | cut -d ' ' -f1)
sudo mount /dev/$drive /run/mount/
sudo rsync -av --delete ~/ /run/mount/backup/
sudo umount /dev/$drive

echo "Backup complete!"
