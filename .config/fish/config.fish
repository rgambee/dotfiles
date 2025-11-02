if status is-interactive
    # Git abbreviations
    abbr --add -- gs 'git status -sb'
    abbr --add -- gd 'git diff'
    abbr --add -- gdc 'git diff --cached'
    abbr --add -- gdi 'git diff --no-index'
    abbr --add -- gl 'git log --oneline --first-parent'
    abbr --add -- ga 'git add -i'
    abbr --add -- gap 'git add -p'
    abbr --add -- gr 'git restore -p'
    abbr --add -- grs 'git restore --staged -p'
    abbr --add -- gca 'git commit --amend --no-edit'
    abbr --add -- gcf 'git commit --fixup'
    abbr --add -- grc 'git rebase --continue'
    abbr --add -- gsu 'git submodule sync --recursive; and git submodule update --init --recursive'
    abbr --add -- gfr 'git fetch Formlabs; and git rebase -i Formlabs/master'
    abbr --add -- gsr 'git show REBASE_HEAD'

    # For quickly running variants of clang-format-diff
    abbr --add -- cdm 'clang-diff Formlabs/master HEAD'
    abbr --add -- cdc 'clang-diff --cached'
    abbr --add -- cdh 'clang-diff HEAD~1 HEAD'

    # For moving files and folders to the trash from the command line
    abbr --add -- trash 'gio trash'

    # Kitty terminal shortcuts
    abbr --add -- clip 'kitty +kitten clipboard'
    abbr --add -- rg 'rg --hyperlink-format=kitty'

    # For changing terminal colors when sshing
    abbr --add -- ssh 'colorssh'

    # OpenVPN abbreviations
    abbr --add -- vpn-start 'openvpn3 session-start --config formlabs'
    abbr --add -- vpn-pause 'openvpn3 session-manage --config formlabs --pause'
    abbr --add -- vpn-resume 'openvpn3 session-manage --config formlabs --resume'
    abbr --add -- vpn-stop 'openvpn3 session-manage --config formlabs --disconnect'
    abbr --add -- vpn-status 'openvpn3 sessions-list'

    # Activate default virtual environment
    source "$HOME/.local/share/venv/common/bin/activate.fish"
end
