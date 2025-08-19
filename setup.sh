#!/bin/bash

# 0. Make sure Homebrew and fish are installed (this is agnostic to Intel vs Apple Silicon):

# If brew missing:
which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Ensure fish installed:
brew list fish >/dev/null 2>&1 || brew install fish


# 1. Define paths and make a dated backup folder

# Adjust if you cloned elsewhere
export DOTFILES="$HOME/dotfiles"

# Dated backup dir to safely stash existing files
STAMP="$(date +%Y%m%d-%H%M%S)"
export DF_BAK="$HOME/dotfiles_backup_$STAMP"
mkdir -p "$DF_BAK"


# 2. Helper: safe-link function (backs up then symlinks)

link() {
  src="$1"; dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    echo "Backing up $dst -> $DF_BAK"
    mv -f "$dst" "$DF_BAK"/
  fi
  echo "Linking $dst -> $src"
  ln -s "$src" "$dst"
}


# 3. Symlink top-level dotfiles
# To connection with the hovey/dotfiles repo that has .bashrc and .gitconfig

[ -f "$DOTFILES/.bashrc" ]    && link "$DOTFILES/.bashrc"    "$HOME/.bashrc"
[ -f "$DOTFILES/.gitconfig" ] && link "$DOTFILES/.gitconfig" "$HOME/.gitconfig"


# 4. Sym link config directories (e.g., nvim, fish)
# The hovey/dotfiles README shows config/nvim -> ~/.config/nvim.  Do the same for any
# other subfolders I keep in the config/ (like fish, etc.)

# Create ~/.config if needed
mkdir -p "$HOME/.config"

# Link any known config subdirs if they exist in your repo:
for d in nvim fish; do
  [ -d "$DOTFILES/config/$d" ] && link "$DOTFILES/config/$d" "$HOME/.config/$d"
done


# 5. Ensure Homebrew is on the PATH for bash and zsh
# The most reliable, chip-agnostic way:
#
# For bash logins (Terminal/iTerm that start bash):
echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> "$HOME/.bash_profile"

# For zsh logins (macOS default since Catalina):
echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> "$HOME/.zprofile"

# 6. Make sure fish also sees Homebrew
# Once fish runs, set a universal PATH entry so it always finds Homebrew:
#
# Start fish once (from bash/zsh):
fish -c 'set -Ux fish_user_paths (brew --prefix)/bin $fish_user_paths' || true


# 7. Verify
#
# In your current shell:
which brew
which fish
brew --version
fish --version

# Try launching fish
fish -c 'echo $PATH; fish --version'

# 8. (optional) Make fish your login shell

# Allow fish as a login shell (if not already)
which fish | sudo tee -a /etc/shells

# Switch your account’s shell to fish
# (optional)
# chsh -s "$(which fish)"

# Log out/in of iterm2


# 9. iterm2 sanity check
# iterm2 -> settings -> profiles -> general -> command = login shell


