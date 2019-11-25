#!/bin/bash

# Force colors in tmux
[[ $(grep -c "#force_color_prompt=" ~/.bashrc 2>/dev/null) -eq 0 ]] || sed -i.bak '/force_color_prompt=/s/^#//g' ~/.bashrc

# Tmux configuration
[[ $(grep -c "base-index" ~/.tmux.conf 2>/dev/null) -eq 0 ]] && echo "set -g base-index 1" >> ~/.tmux.conf
[[ $(grep -c "escape-time" ~/.tmux.conf 2>/dev/null) -eq 0 ]] && echo "set -s escape-time 0" >> ~/.tmux.conf
[[ $(grep -c "aggressive-resize" ~/.tmux.conf 2>/dev/null) -eq 0 ]] && echo "setw -g aggressive-resize on" >> ~/.tmux.conf
[[ $(grep -c "status-bg" ~/.tmux.conf 2>/dev/null) -eq 0 ]] && echo "set -g status-bg black" >> ~/.tmux.conf
[[ $(grep -c "status-fg" ~/.tmux.conf 2>/dev/null) -eq 0 ]] && echo "set -g status-fg white" >> ~/.tmux.conf
[[ $(grep -c "status-right" ~/.tmux.conf 2>/dev/null) -eq 0 ]] && echo 'set -g status-right "#[fg=black]#H"' >> ~/.tmux.conf
[[ $(grep -c "mouse on" ~/.tmux.conf 2>/dev/null) -eq 0 ]] && echo "set -g mouse on" >> ~/.tmux.conf

# Add bash aliases
[[ $(grep -c "alias cd.." ~/.bashrc 2>/dev/null) -eq 0 ]] && echo "alias cd..='cd ..'" >> ~/.bashrc

# Add user inputrc file
[[ -e ~/.inputrc ]] && (
	[[ $(grep -c "include /etc/inputrc" ~/.inputrc) -eq 0 ]] && (echo "\$include /etc/inputrc"; cat ~/.inputrc) > ~/.inputrc
) || (
	echo "\$include /etc/inputrc" > ~/.inputrc
)
# Ignore character case in completion
[[ $(grep -c "set completion-ignore-case on" ~/.inputrc 2>/dev/null) -eq 0 ]] && echo "set completion-ignore-case on" >> ~/.inputrc

# Cycle through completion posibilities
[[ $(grep -c "set show-all-if-ambiguous on" ~/.inputrc 2>/dev/null) -eq 0 ]] && echo "set show-all-if-ambiguous on" >> ~/.inputrc
[[ $(grep -c "set show-all-if-unmodified on" ~/.inputrc 2>/dev/null) -eq 0 ]] && echo "set show-all-if-unmodified on" >> ~/.inputrc
[[ $(grep -c "set menu-complete-display-prefix on" ~/.inputrc 2>/dev/null) -eq 0 ]] && echo "set menu-complete-display-prefix on" >> ~/.inputrc
[[ $(grep -c "\"\t\": menu-complete" ~/.inputrc 2>/dev/null) -eq 0 ]] && echo "\"\t\": menu-complete" >> ~/.inputrc
[[ $(grep -c "\"\e[Z\": menu-complete-backward" ~/.inputrc 2>/dev/null) -eq 0 ]] && echo "\"\e[Z\": menu-complete-backward" >> ~/.inputrc

# Create symlink to media for current user
[[ -L ~/media ]] || ln -s /media/$USERNAME ~/media

# Enable using docker without sudo
[[ -x "$(command -v docker)" ]] && {
    sudo groupadd docker
    sudo gpasswd -a $USER docker
    #newgrp - &
}

# Copy VSCode settings
mkdir -p ~/.config/Code/User
[[ -f ~/.config/Code/User/settings.json ]] && mv ~/.config/Code/User/settings.json ~/.config/Code/User/settings.json.bak
cp ./user/vscode/settings.json ~/.config/Code/User/settings.json
[[ -f ~/.config/Code/User/keybindings.json ]] && mv ~/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json.bak
cp ./user/vscode/keybindings.json ~/.config/Code/User/keybindings.json

# Lower volume to 0%
amixer -D pulse sset Master 0%

# Disable bluetooth
rfkill block bluetooth

# Configure git
git config --global user.name "Petr Mohelník"
git config --global user.email "mohelnik.petr@gmail.com"

# Set Nautilus to show hidden files
#dconf write /org/gtk/settings/file-chooser/show-hidden true

# Powerline settings
#[[ $(grep -c "which powerline-daemon" ~/.bashrc) -eq 0 ]] && ( cat user/powerline.txt | sed -e "s@SITEPACKAGES@$(pip show powerline-status | grep -i "Location:" | cut -d " " -f 2)@" >> ~/.bashrc )

# Add Ruby Gem user directory to PATH variable
#[[ $(grep -c "Gem.user_dir" ~/.bashrc) -eq 0 ]] && [[ -d $(ruby -e "print Gem.user_dir") ]] &&  echo 'export PATH=$PATH:$(ruby -e "print Gem.user_dir")/bin' >> ~/.bashrc
