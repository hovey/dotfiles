# dotfiles

Settings complimentary to .config

```sh
# basic structure
~/dotfiles/
├── .bashrc
├── .gitconfig
├── .config/
│   └── nvim/
├── setup.sh       ← This is your bootstrap script
└── README.md      ← Optional doc for setup steps
```

## Symbolic link

```sh
ln -s SOURCE TARGET
```

`SOURCE` is the actual file or directory you want to point to
`TARGET` is the symlink that will be created

Example:

```sh
ln -s ~/dotfiles/config/nvim ~/.config/nvim
```

Result: When you access `~/.config/nvim`, it points to the real file in `~/dotfiles/config/nvim`.

## Applications

### Ulancher

ulancher.io

* Install: `sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher`
* Start ulancher: `ulancher &`
* To launch it at login: Settings > Startup Applications, Name: Ulauncher Command: ulauncher

Hot key in Wayland: https://github.com/Ulauncher/Ulauncher/wiki/Hotkey-In-Wayland

* Uninstall ulauncher: `sudo apt remove ulauncher`
* Remove ulauncher config files: `sudo apt purge ulauncher`
* Clean up unused packages: `sudo apt autoremove`
* Delete configuration files: `rm -rf ~/.config/ulauncher`
* Confirm ulauncher is gone: `ulauncher` should produce `command not found`

### Albert

* Install dependencies: `sudo apt update`, `sudo apt install curl gnupg`
* Inport Albert's GPG key: `curl -fsSL https://build.opensuse.org/projects/home:manuelschneid3r/public_key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/albert.gpg > /dev/null`
* Didn't work, OBS software center, via https://software.opensuse.org/download/package.iframe?project=home:manuelschneid3r&package=albert&acolor=00cccc&hcolor=00aaaa&locale=en
* Grab binary packages directly:  
* Version of ubuntu: `lsb_release -a` -> `24.04.2`
* Chipset type: `uname -m` -> `x86_64`
* Download: `albert_0.28.0-0+706.1_amd64.deb` -> Downloads folder: `albert_0.28.0-0+706.1_amd64.deb`
* No luck, did not finish this approach.

Pause launcher effort for now.

