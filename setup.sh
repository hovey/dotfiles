#!/bin/bash

echo "🔧 Configuring custom GNOME keyboard shortcuts..."

# List all gnome keybindings with
# gsettings list-keys org.gnome.desktop.wm.keybindings

gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>w']"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-w "['<Super>Left', '<Shift><Alt>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-e "['<Super>Right', '<Shift><Alt>l']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift><Alt>Return']"
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically "['<Shift><Alt>v']"

# Define custom shortcut names
CUSTOM_KEYBINDINGS_BASE="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
KEY1="$CUSTOM_KEYBINDINGS_BASE/custom0/"
KEY2="$CUSTOM_KEYBINDINGS_BASE/custom1/"

# Register custom keybinding paths
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
  "['$KEY1', '$KEY2']"

# Set Brave browser launcher
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY1 name "Launch Brave"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY1 command "brave"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY1 binding "<Shift><Alt>b"

# Set Terminal launcher
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY2 name "Launch Terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY2 command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY2 binding "<Shift><Alt>t"

echo "✓ GNOME keybindings updated"

# # make alt+backspace act like delete key, for moving to trash
# sudo apt install -y interception-tools
# # sudo cp ./etc/interception/udevmon.yaml /etc/interception/udevmon.yaml
# sudo cp ~/dotfiles/etc/interception/udevmon.yaml /etc/interception/udevmon.yaml
# # sudo cp ./etc/dual-function-keys.yaml /etc/dual-function-keys.yaml
# sudo cp ~/dotfiles/etc/dual-function-keys.yaml /etc/dual-function-keys.yaml
# sudo systemctl enable --now udevmon

# # Install interception-tools and plugin
# sudo apt install -y interception-tools
# 
# # Write dual-function-keys.yaml to remap Alt+Backspace → Delete
# sudo tee /etc/dual-function-keys.yaml > /dev/null <<EOF
# MAPPINGS:
#   - KEY: KEY_BACKSPACE
#     TAP: KEY_DELETE
#     HELD: KEY_BACKSPACE
#     HELD_MODIFIERS: [KEY_LEFTALT]
# EOF
# 
# # Write udevmon.yaml to wire up the remapper to your keyboard device
# sudo tee /etc/interception/udevmon.yaml > /dev/null <<EOF
# - JOB: "intercept -g /dev/input/by-path/*event-kbd* | dual-function-keys -c /etc/dual-function-keys.yaml | uinput -d"
#   DEVICE:
#     EVENTS:
#       EV_KEY: [KEY_BACKSPACE, KEY_LEFTALT]
# EOF
# 
# # Enable and start the interception service
# sudo systemctl enable --now udevmon

