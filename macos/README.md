# Settings - macOS modifications

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

## vs code


### Color Scheme

Cmd + Shift + X   // extensions
  One Dark Pro    // Atamis' iconic One Dark theme for Visual Studio by binaryify
  One Dark Pro Night Flat theme  // Chad's favorite
  One Monokai     // Chad's new favorite
Cmd + K + T       // select colorscheme


One Monokai Theme
https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai

