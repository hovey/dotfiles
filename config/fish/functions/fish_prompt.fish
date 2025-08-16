function fish_prompt
    # User and Host
    set_color $fish_color_user
    echo -n "$USER"
    set_color $fish_color_host
    echo -n "@" (hostname -s)

    # Current Directory
    set_color $fish_color_cwd
    echo -n " " (prompt_pwd)

    # Git Branch with Emoji
    if test -n (git_branch_name)
        set_color $fish_color_normal
        echo -n "  " # Branch emoji (Unicode character)
        set_color $fish_color_git
        echo -n (git_branch_name)
    end

    # Python Virtual Environment
    if set -q VIRTUAL_ENV
        set_color $fish_color_virtual_env
        echo -n " (" (basename "$VIRTUAL_ENV") ")"
    end

    # Prompt Separator
    set_color normal
    echo -n " > "
end

# Helper function to get git branch name
function git_branch_name
    git rev-parse --abbrev-ref HEAD 2>/dev/null
end
