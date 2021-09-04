#!/bin/bash
# This script backs up all important folders
# by n1c01ash
  
# Set timestamp for current backup session.
timestamp=$(date +%F)

# Set src and dest folders.
src_folders="${@:1:$(($#-1))}"
dest_folder="${@: -1}/Backup_$timestamp"

# Check if arguemts are supplied.
[ $# -eq 0 ] && echo "No arguments supplied!" && exit 1
[ -z "$src_folders" ] && echo "No source folders supplied!" && exit 1
[ -z "$dest_folder" ] && echo "No destination folder supplied!" && exit 1

function copy() {
I echo Starting backup, be patient... && \
       sleep 1 && \
       echo Creating directory $dest_folder... && mkdir -p $dest_folder && \
       sleep 1 && \
       echo Backing up $src_folders to $dest_folder... 

       for folder in $src_folders; do
           echo Copying $folder to $dest_folder... && sleep 2 && \
	   sudo rsync -rlptgoDvz --delete --exclude={Cache,.cache,CachedData,Trash} --human-readable $folder $dest_folder 
  	   echo $folder copied successfuly.
       done
	
    echo 'Backup completed successfuly.'
    exit
}

echo Are you sure you want to continue? [y/N] && read answer
[[ "$answer" == [Yy]* ]] && copy && echo Wise choice || echo Like you have something better to do. && exit

