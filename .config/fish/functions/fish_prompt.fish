function fish_prompt
    # This is a based on the simple prompt. It looks like
    # /path/to/dir (branch|status) $
    # with the path shortened and colored
    # and a "#" instead of a "$" when run as root.
    set -l symbol '$ '
    set -l color $fish_color_cwd
    if fish_is_root_user
        set symbol '# '
        set -q fish_color_cwd_root
        and set color $fish_color_cwd_root
    end

    #echo -n $USER@$hostname:

    set_color $color
    echo -n (prompt_pwd)
    set_color normal

    fish_git_prompt

    echo -n $symbol
end
