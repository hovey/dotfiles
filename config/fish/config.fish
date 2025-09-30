# Greeting.
echo "================================================"
echo "~/dotfiles/config/fish/config.fish is working..."

# 2022-02-17 
# https://github.com/oh-my-fish/theme-bobthefish/blob/master/functions/fish_prompt.fish
# set -g theme_nerd_fonts yes

# 2022-08-28 allow bash-type bang-bang operator to 
# repeat last command !!
# and repeat last argument !$
# Reference: 
# https://superuser.com/questions/719531/what-is-the-equivalent-of-bashs-and-in-the-fish-shell
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

if test (uname) = "Darwin"
    # macOS-specific code
    # 2024-06-03
    #  chovey@s1088757/Users/chovey> eval "$(/opt/homebrew/bin/brew shellenv)"
    #  chovey@s1088757/Users/chovey> which brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

# 2025-01-07
# make a permanent alias across all fish sessions
function am
    # /Users/chovey/autotwin/automesh/target/release/automesh $argv
    set file $HOME/autotwin/automesh/target/release/automesh
    if test -f $file
        $file $argv
	# $HOME/autotwin/automesh/target/release/automesh $argv
    else
        echo -e "Binary file not found:\n  $file"
        echo -e "build automesh:\n  cargo build --release"
    end
end
function amd
    # /Users/chovey/autotwin/automesh/target/debug/automesh $argv
    set file $HOME/autotwin/automesh/target/debug/automesh
    if test -f $file
        $file $argv
	# $HOME/autotwin/automesh/target/debug/automesh $argv
    else
        echo -e "Binary file not found:\n  $file"
        echo -e "build automesh:\n  cargo build"
    end
end

# 2025-06-19
# abbreviations
abbr -a gp 'git push'
abbr -a ga 'git add'
abbr -a la 'pdflatex -shell-escape --output-directory=temp main.tex'

# 2025-04-01
# create a debug alias for clap1, Rust command line exercises
function cl
    # /Users/chovey/rustschool/clap1/target/debug/clap1 $argv
    $HOME/rustschool/clap1/target/debug/clap1 $argv
end

# 2025-08-16
# Install "Hack" Nerd Font https://www.nerdfonts.com/font-downloads
# to Font Book | My Fonts
#
# Install Starship terminal https://starship.rs/
# Add the following to the end of the ~/.config/fish/config.fish file:
# starship init fish | source
#
# replace above line with a safe check
# Only initialize Starship if it's installed
if type -q starship
    starship init fish | source
end
#
# The above commands tell Fish to use Starship, https://starship.rs/, 
# instead of fish_prompt (in ~/.config/fish/config.fish), to create the prompt.
# the Starship configuration lives at ~/.config/starship.toml


if test (uname) = "Darwin"
    # macOS-specific code

    # 2025-08-25
    # After brew installation of hdf5
    # brew install hdf5
    # the environment variables must be set
    # HDF5 configuration
    set -gx HDF5_DIR (brew --prefix hdf5)
    set -gx HDF5_LIBRARY_PATH (brew --prefix hdf5)/lib
    set -gx HDF5_INCLUDE_PATH (brew --prefix hdf5)/include
    
    echo "  ----------------------------------------------"
    echo "  HDF5 environment variables configured in fish:"
    echo "  HDF5_DIR:          $HDF5_DIR"
    echo "  HDF5_LIBRARY_PATH: $HDF5_LIBRARY_PATH"
    echo "  HDF5_INCLUDE_PATH: $HDF5_INCLUDE_PATH"
    echo "  ----------------------------------------------"
    
    # hdf5 requires cmake, so install cmake too
    # brew install cmake
end

if not contains "$HOME/.cargo.bin" $PATH
    # Prepend the path in case a system-installed rustc needs
    # to be overwritten by the definition below:
    echo "  ----------------------------------------------"
    set -gx PATH "$HOME/.cargo/bin" $PATH
    echo "  set PATH to include HOME/.cargo/bin"
    echo "  ----------------------------------------------"
end


# 2025-09-30 SNL Certificate work for Rust and VPN active
# Run the proxydetect.sh script
echo "Make sure you have proxydetect.sh in your ~ path"
bash ~/proxydetect.sh

# Check the exit status of the last command
if test $status -eq 0
    set -x HTTP_PROXY http://proxy.sandia.gov:80
    set -x HTTPS_PROXY http://proxy.sandia.gov:80
    set -x ALL_PROXY http://proxy.sandia.gov:80
    set -x NO_PROXY '127.0.0.1,localhost,*.sandia.gov,.sandia.gov,sandia.gov,::1,10.,172.16.,172.17.,192.168.,*.local,.local,169.254/16'
    set -x http_proxy $HTTP_PROXY
    set -x https_proxy $HTTPS_PROXY
    set -x all_proxy $ALL_PROXY
    set -x no_proxy $NO_PROXY
end


# Farewell 
echo "~/dotfiles/config/fish/config.fish is done."
echo "==========================================="

