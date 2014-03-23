today=`date "+%Y%m%d"`
backup_folder="/home/ming/Ubuntu One"

echo "backup my unbuntu system to [$backup_folder] ..."
sudo tar --exclude /proc                                    \
         --exclude /mnt                                     \
         --exclude /tmp                                     \
         --exclude /media                                   \
         --exclude "$backup_folder"                         \
         -cvpzf    "$backup_folder/ubuntu-13.10-$today.tgz" \
         /
