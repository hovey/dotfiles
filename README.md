# dotfiles

Settings complimentary to .config

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

