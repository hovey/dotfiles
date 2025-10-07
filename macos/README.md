# Settings - macOS modifications

## installers

* brew
* ParaView-5.13.1-arm-Sandia.dmg
* Cubit-16.18.1-Mac64.dmg
* Cubit-16.18.2-Mac64.dmg
* MacTeX.pkg
* Hack.zip  // Nerd fonts
* cargo
  * cargo install mdbook
  * cargo install mdbook-katex
  * cargo install mdbook-cmdrun

## screenshots

macOS screenshots from .png to .jpg by default

```sh
defaults write com.apple.screencapture type jpg
```

## finder window

macos long file paths in finder window

```sh
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
killall Finder
```

and menu View | Show Pathbar

## show file extensions


```sh
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder
```

## show hidden files

```sh
defaults write com.apple.finder AppleShowAllFiles true
killall Finder
```

## trackpad press and hold (force click) brings up dictionary, how to stop that

On system settings, track pad, point & click, there is "Force Click and haptic feedback"
this can be turned off via (didn't work, so update settings with the GUI to turn off)

```sh
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true
```

# new finder does "Recent", how to make it go to "home" instead?

```sh
defaults write com.apple.finder NewWindowTarget -string "PfHm"
killall Finder
```

-string "PfHm": This sets the value of the key to "PfHm". 
This is a special code that represents the Path for Home directory, which is your ~ folder.

## Update the date format from mm/dd/yy to YYYY-mm-dd

Excel uses the format in System settings:

System settings, General, Language & Region

Date format: from 8/19/25 to 2025-08-19

## napari

A fast, interactive viewer for multi-dimensional images in Python.

https://napari.org/stable/

```sh
cd ~/autotwin/experiment
source .venv/bin/activate
uv pip install "napari[all]"
napari # run from the command line
```

## vs code

### Color Scheme

Cmd + Shift + X   // extensions
  One Dark Pro    // Atamis' iconic One Dark theme for Visual Studio by binaryify
  One Dark Pro Night Flat theme  // Chad's favorite
  One Monokai     // Chad's new favorite
Cmd + K + T       // select colorscheme


One Monokai Theme
https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai

## rg (RIP grep)

```sh
brew install ripgrep
```

## install pkg-config

For debugging why automesh doesn't compile when trying to link to ZLIB.

The Rust netcdf crate has two ways to work:

1. Use the system NetCDF (which is what we want) - faster, more reliable, uses my Homebrew installation
2. Build from source (what is happening with `cargo build` on automesh), which is slower, error-prone, tries to compile NetCDF during the Rust build.

If I were to uninstall NetCDF via Homebrew, the netcdf crate will be force dto build from source, which is exactly the problematic path I'm experiencing now.

The problem isn't that I have NetCDF installed - it's that the Rust build system isn't findibng or using my Homebrew NetCDF installation properly.  Instead, the Rust build system is falling back to building from source via `netcdf-src`.

```sh
export NETCDF_DIR=/opt/homebrew
export HDF5_DIR=/opt/homebrew
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH"
cargo clean
cargo build
```

## Proxy settings

Create or update the `~/.config/pip/pip.conf` file:

```sh
[global]
# index = https://nexus.web.sandia.gov/repository/pypi-proxy
# index-url = https://nexus.web.sandia.gov/repository/pypi-proxy/simple
proxy = proxy.sandia.gov:80
trusted-host = py.pi.org, files.pythonhosted.org
```

## Certificate

* zscalar info
  * https://wiki.sandia.gov/pages/viewpage.action?pageId=227381234#SandiaProxyConfiguration,Troubleshooting&HTTPS/SSLinterception-MacOSX(Apple)

Create [`proxydetect.sh`](proxydetect.sh), place it in the root (`~`),and `chmod +x ~/proxydetect.sh`

```sh
#!/usr/bin/env bash
#
# check-vpn-connected
#
# Determines if the Global Protect VPN is connected. The detection method uses
# a comparison of the client's configured IP addresses and the active network
# interface addresses.
#
# - If VPN is connected, the script exits with code 0.
#
# - If VPN is NOT connected, the script exits with code 1.
#
# Arguments:
#
#   -v | --verbose  Prints out a message to STDERR if not connected.
#   -d | --debug    Prints debugging info. Implies --verbose.
#
# shellcheck disable=SC2155
#   (see https://github.com/koalaman/shellcheck/wiki)
#

main() {
  # check network location first, always set proxies on SRN Wired
  # this is my only contribution to a script borrowed from https://gist.github.com/kaleksandrov/3cfee92845a403da995e7e44ba771183
  local netloc=$(networksetup -getcurrentlocation)
  if [[ $netloc == "SRN Wired" ]]; then
    exit 0;
  fi

  local verbose=0;
  local debug=0;
  local ipv4AddressRegex="(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)";

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --verbose|-v)
        # Verbose output.
        verbose=1;
        ;;

      --debug|-d)
        # Debug output; implies verbose.
        debug=1;
        verbose=1;
    esac;
    shift;
  done;

  # Get the active interface addresses.
  # shellcheck disable=SC2207
  # IPv6 support would require filtering on 'inet6' and an IPv6 regex.
  local interfaceIPs=($(ifconfig -a -u inet | grep -F "inet" | grep -oE "${ipv4AddressRegex}"));
  if [[ "${debug}" -ne 0 ]]; then
    >&2 echo "Interface Addresses: ${interfaceIPs[*]}";
  fi;

  # Read Global Protect client configuration, return the listed IPv4 addresses.
  # IPv6 support would require filtering on 'PreferredIPv6_' and an IPv6 regex.
  IFS=$'\n' read -d '' -r -a vpnIPs < <( \
    defaults read /Library/Preferences/com.paloaltonetworks.GlobalProtect.settings.plist | \
    grep -F "PreferredIP_" | \
    grep -oE "${ipv4AddressRegex}" \
  );
  if [[ "${debug}" -ne 0 ]]; then
    >&2 echo "VPN IPs: ${vpnIPs[*]}";
  fi;

  # If one of the interface IPs matches one of the VPN IPs then the VPN is connected.
  # printf converts the bash array into a pipe-delimited list and XXXX is a never-match last element.
  if grep -qE "($(printf '%s|' "${interfaceIPs[@]}")XXXX)" <<< "${vpnIPs[@]}"; then
    exit 0;
  else
    if [[ "${verbose}" -ne 0 ]]; then
      >&2 echo "$(tput setaf 208)Active VPN connection required!$(tput op)";
    fi;

    exit 1;
  fi;
}

main "$@";
```

Add the following to `~/.bashrc` (or `~/.zshrc` or `~/.bash_profile`):

```sh
bash ~/proxydetect.sh
if [[ $? == 0 ]]; then
    export HTTP_PROXY=http://proxy.sandia.gov:80
    export HTTPS_PROXY=http://proxy.sandia.gov:80
    export ALL_PROXY=http://proxy.sandia.gov:80
    export NO_PROXY=127.0.0.1,localhost,*.sandia.gov,.sandia.gov,sandia.gov,::1,10.,172.16.,172.17.,192.168.,*.local,.local,169.254/16
    export http_proxy=${HTTP_PROXY}
    export https_proxy=${HTTPS_PROXY}
    export all_proxy=${ALL_PROXY}
    export no_proxy=${NO_PROXY}
fi
```

The `proxydetect.sh` interferes with `brew upgrade`, so

```sh
mv proxydetect.sh proxydetect.sh.bak
brew upgrade
mv proxydetect.sh.bak proxydetect.sh 
```

## Disable capslock (caps lock)

Open system settings, keyboard, Keyboard Shortcuts... button, Modifier Keys, Caps Lock map to Escape (or No Action).
Escape is useful for VIM.


