# fish

fish (friendly shell) config files

``` bash
> fish_config  # for the interactive fish configuration tool, colors, prompt
```

For the delicious command line prompt that shows Git info, execution time, and syntax
coloring inside of iTerm2, with Starship.

brew install fish
chsh -s /opt/homebrew/bin/fish

brew install starship

# add this to your ~/.config/fish/config.fish
starship init fish | source

