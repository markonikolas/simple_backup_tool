#!/bin/bash
# This script backs up all important folders

# Set timestamp for current backup session
timestamp=$(date +%F)
dest_folder="$1Backup_$timestamp"

[ $# -eq 0 ] && echo "No arguments supplied" && exit 1
[ -z "$dest_folder" ] && echo "No destination folder supplied!" && exit 1

echo 'Starting backup, be patient...' && sleep 1 && echo Created directory $dest_folder... && \
	sleep 1 && echo Copying /opt, /home, /usr, and /etc to $dest_folder... && sleep 2 && \
	sudo rsync -rlptgoDvz --delete --exclude={Cache,.cache,CachedData,Trash} /home $dest_folder && \
	sudo rsync -rlptgoDvz --delete --exclude={Cache,.cache,CachedData,Trash} /usr $dest_folder && \
	sudo rsync -rlptgoDvz --delete --exclude={cache,.cache,cacheddata,trash} /opt $dest_folder && \
	sudo rsync -rlptgoDvz --delete --exclude={cache,.cache,cacheddata,trash} /etc $dest_folder && \
	echo 'Backup completed successfuly.'

