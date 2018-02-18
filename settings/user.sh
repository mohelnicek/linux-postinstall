#!/usr/bin/env bash

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

# Copy template config files
[[ -f ~/.editorconfig ]] || cp ./user/.editorconfig ~
[[ -f ~/.gitignore ]] || cp ./user/.gitignore ~

# Add bash aliases
[[ $(grep -c "alias cd.." ~/.bashrc 2>/dev/null) -eq 0 ]] && echo "alias cd..='cd ..'" >> ~/.bashrc
[[ $(grep -c "alias atom" ~/.bashrc 2>/dev/null) -eq 0 ]] && echo "alias atom='atom .'" >> ~/.bashrc
[[ $(grep -c "alias code" ~/.bashrc 2>/dev/null) -eq 0 ]] && echo "alias code='code .'" >> ~/.bashrc
[[ $(grep -c "alias powershell" ~/.bashrc 2>/dev/null) -eq 0 ]] && echo "alias powershell='docker run -it microsoft/powershell'" >> ~/.bashrc

# Create symlink to media for current user
[[ -L ~/media ]] || ln -s /media/$USERNAME ~/media

# Enable using docker without sudo
[[ -x "$(command -v docker)" ]] && {
    sudo groupadd docker
    sudo gpasswd -a $USER docker
    #newgrp - &
}

# Set Nautilus to show hidden files
#dconf write /org/gtk/settings/file-chooser/show-hidden true

# Powerline settings
#[[ $(grep -c "which powerline-daemon" ~/.bashrc) -eq 0 ]] && ( cat user/powerline.txt | sed -e "s@SITEPACKAGES@$(pip show powerline-status | grep -i "Location:" | cut -d " " -f 2)@" >> ~/.bashrc )

# Add Ruby Gem user directory to PATH variable
#[[ $(grep -c "Gem.user_dir" ~/.bashrc) -eq 0 ]] && [[ -d $(ruby -e "print Gem.user_dir") ]] &&  echo 'export PATH=$PATH:$(ruby -e "print Gem.user_dir")/bin' >> ~/.bashrc

