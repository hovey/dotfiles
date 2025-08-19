# 2025-09-19

#  Completely uninstall and reinstall iTerm2

rm -rf /Applications/iTerm.app
brew uninstal --cask iterm2

# Remove prefernces and settings

rm -rf ~/Library/Preferences/com.googlecode.iterm2.plist

# Saved application stat

rm -rf ~/Library/Saved\ Application\ State/com.googlecode.iterm2.savedState

# Caches

rm -rf ~/Library/Caches/com.googlecode.iterm

# Appliation support files

rm -rf ~/Library/Application\ Support/iTerm2

# reboot (this iensures all caches and processes are cleared)



# reinstall

brew install --cask iterm2

# launch iterm2

open -a iTerm



# configure

# shell

Preferences | Profile | General | Command
from Login Shell: /bin/bash
to Cutom Shell: /opt/homebrew/bin/fish

# colors

Preferences | Profile | Colors | Color Preset
Import...
~/dotfiles/iterm2/colors/MaterialDarker.itermcolors
Color Presets... -> MaterialDarker
Update Both Modes




# Make sure Hack Nerd font is already installed in the Font Book

Preferences | Profile | Text | Font: Hack Nerd Font Mono Regular 18 pt

