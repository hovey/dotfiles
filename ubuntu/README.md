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

