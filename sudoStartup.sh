#!/usr/bin/env bash
# max_user_watches_stuff
export SUDO_ASKPASS=/usr/bin/ksshaskpass

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system

# setup locking with xss-lock
$HOME/scripts/autolock.sh
