#!/bin/bash

# Enable network time
#sudo timedatectl set-ntp true
#sudo systemctl restart ntpd

# Remove EasyTag from default file explorer list
#sudo sed -i.bak -e "s@inode/directory=easytag.desktop;@inode/directory=@" /usr/share/applications/mimeinfo.cache

# Add noacpi to kernel parameters on HP 530 laptop
[[ $(sudo dmidecode | grep -c -i "HP 530")  -ne 0 ]] && [ $(grep -c -i "noacpi" /etc/default/grub ) -eq 0 ] && sudo sed -i -- 's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="noacpi /' /etc/default/grub && sudo update-grub

# Set internal graphics as default for HP Pavilion laptop
[[ $(sudo dmidecode | grep -c -i "HP Pavilion")  -ne 0 ]] && sudo system76-power graphics intel && sudo system76-power graphics power auto

[ $(grep -c -i "# BrowseProtocols none" /etc/cups/cups-browsed.conf) -eq 1 ] && sudo sed -i.bak -E -e "s/^# (BrowseProtocols none)/\1/" /etc/cups/cups-browsed.conf
sudo systemctl restart cups-browsed
sudo systemctl restart cups

