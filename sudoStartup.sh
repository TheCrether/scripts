# max_user_watches_stuff
export SUDO_ASKPASS=/usr/bin/ksshaskpass

#echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/50-max-user-watches.conf
#sudo sysctl --system
echo 512000 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
$HOME/scripts/autolocking.sh
