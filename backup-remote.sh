#!/bin/bash

##### setup #####
mkdir -p $destination_folder
destination_folder=/home/jamie/backup/`date +%F`

# checking if path exists, otherwise exit
if [ -d $destination_folder ]; then
	echo "Backing up to $destination_folder ...";
else
	echo "No directory $destination_folder. Exiting...";
	exit 1;
fi

# backup VPS
rsync -e 'ssh -p 22' --password-file ~/rsync.password -avl --delete --stats --progress jamie@45.77.98.57:/var/www :/home/jamie $destination_folder/
