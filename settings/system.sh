#!/usr/bin/env bash

# Enable network time
#sudo timedatectl set-ntp true
#sudo systemctl restart ntpd

# Remove EasyTag from default file explorer list
#sudo sed -i.bak -e "s@inode/directory=easytag.desktop;@inode/directory=@" /usr/share/applications/mimeinfo.cache

# Add noacpi to kernel parameters on HP 530 laptop
[[ $(sudo dmidecode | grep -c -i "HP 530")  -ne 0 ]] && [ $(grep -c -i "noacpi" /etc/default/grub ) -eq 0 ] && sudo sed -i -- 's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="noacpi /' /etc/default/grub && sudo update-grub
