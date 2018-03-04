# Backup and sync scripts

These shell scripts I use for my sync and backup operations.

## rsync_nas.sh

This script is using rsync to sync a bunch of folders to a NAS.
At the end, a Boxcar notification is made so that I get a push notification to my phone.
I added this rsync script to my launchctl/crontab to run once a day.
From my NAS I use rclone to do an off-site backup.

__For Mac use launchctl:__

```shell
$ sudo cp com.rsync_nas.plist /Library/LaunchAgents
```

__For Linux use crontab:__

```shell
$ crontab -e
```

```
30 19 * * * /home/anders/backup/rsync_nas.sh >> /home/anders/backup/rsync_nas.log 2>&1
```

## tar_incremental_backup.sh

This script does an incremental backup of a directory.

## tar_recover_backup.sh

This script recovers incremental tar archives.
