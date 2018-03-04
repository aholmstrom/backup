#!/bin/bash

ARCHIVE_FILES="/home/anders/backup/backup-*.tar.gz"

for file in $ARCHIVE_FILES
do
  tar -vGxzf $file
done

echo
echo "Done!"

exit 0
