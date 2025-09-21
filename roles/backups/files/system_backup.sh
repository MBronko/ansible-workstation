SSH_PRIVATE_KEY=/home/bronko/.ssh/id_rsa_homelab


SOURCE_DIR_EXCLUDE=""
for dir in /sys /run /dev /proc /tmp /usr/tmp /var/cache /media /mnt; do
	SOURCE_DIR_EXCLUDE="$SOURCE_DIR_EXCLUDE --exclude=$dir/*"
done

DESTINATION_DIR=/mnt/main-pool/backup/backup-bronkobian
DESTINATION_USER=bronko
DESTINATION_HOST=dev.truenas.home

RSYNC_OPTIONS="-avzxHt --delete -M--fake-super"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
LOGFILE_DIR=/var/log/rsync_backup
LOGFILE=$LOGFILE_DIR/${DATE}_rsync_backup.log

sudo mkdir -p $LOGFILE_DIR

for SOURCE_DIR in / /boot/ /boot/efi/; do
	sudo rsync $RSYNC_OPTIONS $SOURCE_DIR_EXCLUDE -e "ssh -i $SSH_PRIVATE_KEY" --log-file=$LOGFILE $SOURCE_DIR $DESTINATION_USER@$DESTINATION_HOST:$DESTINATION_DIR$SOURCE_DIR
done