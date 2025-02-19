# dest=/data/home/ObsidianBackups

# #The line below will store multiple folders in an array (files)
# day=$(date +%F\|%T)
# archive_file="Obsidian-Backup-$day.tgz"
# echo $archive_file

# # Print start status message.
# echo "Backing up Obisidian Vault to $dest/$archive_file"  # Here, $i will be the first directory
# date
# echo

# # Backup the files using tar.
# tar czf $dest/$archive_file /data/home/pizza2d1/'Evidence Folder'

# echo
# echo "Backup finished"



day=$(date +%F)
dest=/data/home/ObsidianBackups
mkdir $dest/$day
saveto=$dest/$day

#The line below will store multiple folders in an array (files)
time=$(date +%F\|%T)
archive_file="Obsidian-Backup-$time.tgz"
echo $archive_file

# Print start status message.
echo "Backing up Obisidian Vault to $dest/$day"  # Here, $i will be the first directory
date
echo

# Backup the files using tar.
tar czf $saveto/$archive_file /data/home/pizza2d1/'Evidence Folder'

echo
echo "Backup finished"
