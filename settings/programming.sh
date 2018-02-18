#!/usr/bin/env bash

# Install Ruby packages
#PATH=$PATH:$(ruby -e "print Gem.user_dir")/bin
#sudo gem update --conservative
#sudo gem install jekyll --conservative  `# static site generator`
#sudo gem install bundler --conservative  `# gems manager`

# Install Python packages
sudo pip3 --exists-action i install \
	  pyserial esptool adafruit-ampy  `# micropython utilities` \
	  pyinstaller  `# executable bundling`

# Install Node packages
sudo npm install -g create-react-app
