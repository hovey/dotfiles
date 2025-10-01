# Ubuntu modifications

## Fish, not bash, the default shell

Install fish

```sh
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
```

Change default shell

```sh
chsh -s $(which fish)
```

To verify that fish is now the default shell, log out and then log back into
the terminal session.  Open a new terminal and run

```sh
echo $SHELL
```

The output should be something like `/usr/bin/fish`.

## Disable Multiple Workspaces

Settings, Multitasking, Workspaces, set number to 1

## Install Nerd Font Hack

1. Create a fonts directory

mkdir -p ~/.local/share/fonts

2. Download the Hack Nerd Font, Hack.zip.  Unzip

unzip ~/Downloads/Hack.zip -d ~/.local/share/fonts/

3. Update the font cache

fc-cache -fv

After installation, you need to configure the terminal and other applications to use the
new font.  For terminal, open termina's preferneces and select Hack Nerd Font.

Hack Nerd Font didn't look good, so reverted to original font, DejaVu Sans Mono.

## gTile for Ubuntu, similar to Magnet for macOS

gTile is a GNOME Shell extension that provides advanced tiling capabilities.

1. Install

sudo apt update
sudo apt install gnome-shell-extension-manager

2. Go to the gTile extension page:
https://extensions.gnome.org/extension/28/gtile/

3. Install the extension:
Click the slider to turn it "ON".  A pop-up will appear to confirm.  Click Install.

4. Manage with the Extension Manager.  Open Extension Manager from applications to configure.

Restart the Gnome shell.

## Install vscode

Snap is a package management system that comes pre-installed on
recent Ubuntu versions.  This is the simplist way to install
VS Code and to make sure it automatically stays updated.

sudo snap install code --classic

## Install mdbook

sudo snap install mdbook

## Paraview

sudo apt update
sudo apt install paraview
paraview

(CBH dit NOT need, but noted:)
If you encounter an error related to a missing Qt platform plugin (like xcb), you may need:
sudo apt install libxcb-xinerama0 libxcb-xinput0

