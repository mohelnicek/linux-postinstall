#!/usr/bin/env bash

# Custom keybinds - Ctrl+Alt+T gnome-terminal, Ctrl+Alt+L lock screen
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Primary><Alt>t'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'gnome-terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'open gnome terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Primary><Alt>l'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'lock screen'"

# Time and Gnome Top Bar settings
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-format '24h'
dconf write /org/gtk/settings/file-chooser/clock-format "'24h'"

# Theme appearence settings
gsettings set org.gnome.desktop.interface gtk-theme 'Pop-slim'
gsettings set org.gnome.desktop.interface icon-theme 'Pop'

# Set background
gsettings set org.gnome.desktop.background color-shading-type 'solid'
gsettings set org.gnome.desktop.background picture-options 'zoom'
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/pop/jared-evans-119758.jpg'
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background secondary-color '#000000'

#Set screensaver
gsettings set org.gnome.desktop.screensaver color-shading-type 'solid'
gsettings set org.gnome.desktop.screensaver picture-options 'zoom'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/pop/jared-evans-119758.jpg'
gsettings set org.gnome.desktop.screensaver primary-color '#000000'
gsettings set org.gnome.desktop.screensaver secondary-color '#000000'

# Disable desktop icons
gsettings set org.gnome.desktop.background show-desktop-icons false

# Lock screen settings
#gsettings set org.gnome.desktop.lockdown disable-lock-screen false
gsettings set org.gnome.desktop.screensaver lock-delay 300

# Show minimize button in window titlebar
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'

# Set Input sources to US + CZ
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'cz')]"

# Touchbar settings
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad speed 1.0
#gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
#gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled true

# Night Light settings
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 20.0
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 7.0

# Disable Autorun
gsettings set org.gnome.desktop.media-handling autorun-never true

# Disable screen rotation
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true

##############
# Extensions #
##############

# Disable extensions before configuring - might prevent issues with some extensions
gsettings set org.gnome.shell disable-user-extensions true
sleep 10

# Caffeine settings
dconf write /org/gnome/shell/extensions/caffeine/show-notifications false
dconf write /org/gnome/shell/extensions/caffeine/restore-state true

# OpenWeather settings
dconf write /org/gnome/shell/extensions/openweather/city "'49.1922443,16.6113382>Brno, okres Brno-město, Jihomoravský kraj, Jihovýchod, Česko >-1'"
dconf write /org/gnome/shell/extensions/openweather/unit "'celsius'"
dconf write /org/gnome/shell/extensions/openweather/wind-speed-unit "'kph'"
dconf write /org/gnome/shell/extensions/openweather/pressure-unit "'kPa'"
dconf write /org/gnome/shell/extensions/openweather/menu-alignment 100.0
dconf write /org/gnome/shell/extensions/openweather/position-in-panel "'right'"
dconf write /org/gnome/shell/extensions/openweather/days-forecast 3

# System monitor settings
dconf write /org/gnome/shell/extensions/system-monitor/cpu-display false
dconf write /org/gnome/shell/extensions/system-monitor/memory-display false
dconf write /org/gnome/shell/extensions/system-monitor/net-display false
dconf write /org/gnome/shell/extensions/system-monitor/net-style "'digit'"
dconf write /org/gnome/shell/extensions/system-monitor/memory-style "'digit'"
dconf write /org/gnome/shell/extensions/system-monitor/cpu-style "'digit'"
dconf write /org/gnome/shell/extensions/system-monitor/compact-display true

# Dash to Panel settings
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-position "'TOP'"
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-size 24
dconf write /org/gnome/shell/extensions/dash-to-panel/appicon-margin 1
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-style-unfocused "'METRO'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-size 1
dconf write /org/gnome/shell/extensions/dash-to-panel/click-action "'CYCLE'"
dconf write /org/gnome/shell/extensions/dash-to-panel/hot-keys true

# Dash to Dock settings
#gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
#gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode 'ALL_WINDOWS'
#gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme true
#gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
#gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Re-enable extensions to see the changes
gsettings set org.gnome.shell disable-user-extensions false


# TODO set favourite apps
