#!/usr/bin/env bash

# Switch to noninteractive mode
export DEBIAN_FRONTEND=noninteractive

# Skip virtualbox-ext-pack licence window
echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections


# Update & upgrade
sudo apt update
sudo apt -y upgrade


# Google Chrome and Google Earth
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
[[ -f /etc/apt/sources.list.d/google-chrome.list ]] || echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
#sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/earth/deb/ stable main"
[[ -f /etc/apt/sources.list.d/google-earth-pro.list ]] || echo "deb [arch=amd64] http://dl.google.com/linux/earth/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-earth-pro.list

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update after setting apt sources
sudo apt update


# Software instalation
sudo apt install -y \
    vim  `# text editors` \
    texlive-full gummi  `# latex` \
    chromium-browser thunderbird thunderbird-locale-cs google-chrome-stable  `# browser/e-mail` \
    python python3 python3-pip perl ruby jekyll nodejs npm php composer valgrind haskell-platform rustc cargo openjdk-8-jre openjdk-8-jdk openjdk-9-jre openjdk-9-jdk scilab gnat  `# programming` \
    epydoc-doc git  `# documentation and version control` \
    wine32 wine64 playonlinux steam  `# windows compatibility and games` \
    inkscape inkscape-open-symbols svgtune gimp  `# image tools` \
    blender openshot vlc obs-studio simplescreenrecorder youtube-dl  `# video tools` \
    audacity soundconverter easytag  `# audio tools` \
    graphviz gnuplot  `# graph visualization` \
    ntfs-3g mtp-tools  `# file system support` \
    remmina remmina-plugin-rdp remmina-plugin-vnc remmina-plugin-xdmcp freerdp-x11  `# remote control` \
    mc krusader kdiff3 krename kate  `# file manager + plugins` \
    fakeroot simple-scan screen picocom nmap lsof arp-scan lsscsi gddrescue gdebi-core cifs-utils nfs-common tmux screenfetch snapd docker-ce virt-viewer  `# system utilities` \
    gnome-shell-extension-caffeine gnome-shell-extension-weather gnome-shell-extension-better-volume gnome-shell-extension-dash-to-panel gnome-shell-extension-system-monitor  `# gnome shell extensions` \
    qgis google-earth-pro-stable  `# maps and gis` \
    virtualbox virtualbox-ext-pack  `# virtualization`

# Install snap apps
sudo snap install --classic vscode
sudo snap install --classic atom
sudo snap install discord
sudo snap install brave

# Pull docker images
sudo docker pull microsoft/powershell:latest

# Teamviewer
#wget -O /tmp/teamviewer_i386.deb https://download.teamviewer.com/download/teamviewer_i386.deb
#sudo gdebi /tmp/teamviewer_i386.deb

# gnome-shell-extension-installer
#wget -O /tmp/gnome-shell-extension-installer "https://github.com/mohelnicek/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
#sudo mv /tmp/gnome-shell-extension-installer /usr/bin/
#sudo chmod +x /usr/bin/gnome-shell-extension-installer

# Enable Gnome shell extensions
gsettings set org.gnome.shell disable-user-extensions true
sleep 10
gnome-shell-extension-tool -e 'caffeine@patapon.info'
gnome-shell-extension-tool -e 'openweather-extension@jenslody.de'
gnome-shell-extension-tool -e 'bettervolume@tudmotu.com'
gnome-shell-extension-tool -e 'dash-to-panel@jderose9.github.com'
gnome-shell-extension-tool -e 'system-monitor@paradoxxx.zero.gmail.com'
gsettings set org.gnome.shell disable-user-extensions false
#gnome-shell --replace >/dev/null 2>/dev/null &


# Fix sources (idk why it does that :/)
[[ $(grep -c "deb http" /etc/apt/sources.list.d/google-earth-pro.list 2>/dev/null) -eq 1 ]] && sudo sed -i '/deb http/s/deb http/deb [arch=amd64] http/g' /etc/apt/sources.list.d/google-earth-pro.list


# Removing unwanted packages
sudo apt purge -y geary
sudo apt autoremove -y

