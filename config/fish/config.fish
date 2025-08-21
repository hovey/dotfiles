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

# 2024-06-03
#  chovey@s1088757/Users/chovey> eval "$(/opt/homebrew/bin/brew shellenv)"
#  chovey@s1088757/Users/chovey> which brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2025-01-07
# make a permanent alias across all fish sessions
function am
    /Users/chovey/autotwin/automesh/target/release/automesh $argv
end
function amd
    /Users/chovey/autotwin/automesh/target/debug/automesh $argv
end

# 2025-06-19
# abbreviations
abbr -a gp 'git push'
abbr -a ga 'git add'
abbr -a la 'pdflatex -shell-escape --output-directory=temp main.tex'

# 2025-04-01
# create a debugt alias for clap1, Rust command line exercises
function cl
    /Users/chovey/rustschool/clap1/target/debug/clap1 $argv
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

# 2025-08-21
# Weather forcast

# Fetch and display weather for Portland, ME in Fahrenheit
set portland_weather (curl -s "wttr.in/Portland,ME?format=%C+%t&u")
# echo "Weather forecast for Portland, ME:"
echo "Portland ME: $portland_weather"

# Fetch and display weather for Albuquerque, NM in Fahrenheit
set albuquerque_weather (curl -s "wttr.in/Albuquerque,NM?format=%C+%t&u")
# echo "Weather forecast for Albuquerque, NM:"
echo "Albuquerque NM: $albuquerque_weather"

