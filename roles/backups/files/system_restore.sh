SSH_PRIVATE_KEY=/home/bronko/.ssh/id_rsa_homelab


SOURCE_DIR=/mnt/main-pool/backup/backup-bronkobian/
SOURCE_USER=bronko
SOURCE_HOST=dev.truenas.home

DESTINATION_DIR=/mnt/system_restore

RSYNC_OPTIONS="-avzHt --delete -M--fake-super"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
LOGFILE_DIR=/var/log/rsync_backup
LOGFILE=$LOGFILE_DIR/${DATE}_rsync_backup.log

sudo mkdir -p $LOGFILE_DIR
sudo mkdir -p $DESTINATION_DIR

sudo rsync $RSYNC_OPTIONS -e "ssh -i $SSH_PRIVATE_KEY" --log-file=$LOGFILE $SOURCE_USER@$SOURCE_HOST:$SOURCE_DIR $DESTINATION_DIR 