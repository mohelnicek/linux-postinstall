#!/usr/bin/env bash

function echo_green {
	echo -e "\n\n\e[2;30;42m$1\e[0m\n"
}

echo_green "Running linux postinstall script."

# Check if internet connection is available
wget -q --spider http://google.com || {
    echo "Connect to internet before running this script!"
    exit 1
}

# Prevent running script as root
[[ $EUID -eq 0 ]] && {
    echo "This script needs to be run without root privileges!"
    exit 1
}

# Keep refreshing sudo timeout
(while kill -0 $$ >/dev/null 2>/dev/null; do sudo -n true; sleep 10; done) &


echo_green "Software installation, user and system settings"

pushd "settings" >/dev/null
for script in `find . -maxdepth 1 -name "*.sh" -type f | LC_COLLATE=C sort`; do
	echo_green "Running $script"
	. "$script";
done
popd

# Print some information
screenfetch

echo_green "Done, restart your computer!"
