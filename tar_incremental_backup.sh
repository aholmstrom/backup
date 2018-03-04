#!/bin/bash

TIME=$(date "+%Y.%m.%d-%H.%M.%S")
ARCHIVE_FILE="/home/anders/backup/backup-$TIME.tar.gz"
SNAPSHOT_FILE="/home/anders/backup/snapshot/backup.snar"
SOURCE_DIRECTORY="/home/anders/mydata"

tar -cvzf $ARCHIVE_FILE -g $SNAPSHOT_FILE $SOURCE_DIRECTORY

echo
echo "Done!"

exit 0
