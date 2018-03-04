#!/bin/bash

# settings
FLAGS="-azP"
HOST="root@xxx.xxx.xxx.xxx"
BACKUP_ROOT="/shares/sync"

BOXCAR_ENDPOINT="https://new.boxcar.io/api/notifications"
BOXCAR_CREDENTIALS="xxx"
BOXCAR_SOURCE="rsync_nas.sh"

# folders
declare -a folders=("/home/anders/Pictures"
                    "/home/anders/Documents"
                   )

echo "Start folder sync to $HOST"

for dir in "${folders[@]}"
do
  rsync $FLAGS "$dir" $HOST:$BACKUP_ROOT
  OUT=$?
  if [ $OUT -eq 0 ];then
    echo "Folder $dir DONE!"
  else
    echo "Folder sync failed on $dir"
    # notify Boxcar "failed"
    curl -d "user_credentials=$BOXCAR_CREDENTIALS" \
         -d "notification[title]=Folder sync failed" \
         -d "notification[long_message]=<b>Host: </b>$HOST<br><br>Folder sync failed on $dir<br>" \
         -d "notification[sound]=notifier-1" \
         -d "notification[source_name]=$BOXCAR_SOURCE" \
         $BOXCAR_ENDPOINT
    echo
    echo "Failed!"

    exit 1
  fi
done

# notify Boxcar "complete"
curl -d "user_credentials=$BOXCAR_CREDENTIALS" \
     -d "notification[title]=Folder sync complete" \
     -d "notification[long_message]=<b>Host: </b>$HOST<br><br>Folder sync complete<br>" \
     -d "notification[sound]=success" \
     -d "notification[source_name]=$BOXCAR_SOURCE" \
     $BOXCAR_ENDPOINT

echo
echo "Done!"

exit 0
