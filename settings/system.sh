#!/usr/bin/env bash

# Enable network time
#sudo timedatectl set-ntp true
#sudo systemctl restart ntpd

# Remove EasyTag from default file explorer list
#sudo sed -i.bak -e "s@inode/directory=easytag.desktop;@inode/directory=@" /usr/share/applications/mimeinfo.cache

# Add noacpi to kernel parameters on HP 530 laptop
[[ $(sudo dmidecode | grep -c -i "HP 530")  -ne 0 ]] && [ $(grep -c -i "noacpi" /etc/default/grub ) -eq 0 ] && sudo sed -i -- 's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="noacpi /' /etc/default/grub && sudo update-grub

# Fix PPTP VPN in Ubuntu 17.10 with Gnome 3 (https://bbs.archlinux.org/viewtopic.php?id=153763)
[[ $(lsb_release -rs) == "17.10" ]] && [[ ! -L /usr/lib/gnome-shell/nm-openconnect-auth-dialog ]] && sudo ln -s /usr/lib/networkmanager/nm-openconnect-auth-dialog /usr/lib/gnome-shell/

