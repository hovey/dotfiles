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

## vs code

### Color Scheme

Cmd + Shift + X   // extensions
  One Dark Pro    // Atamis' iconic One Dark theme for Visual Studio by binaryify
  One Dark Pro Night Flat theme  // Chad's favorite
  One Monokai     // Chad's new favorite
Cmd + K + T       // select colorscheme


One Monokai Theme
https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai

