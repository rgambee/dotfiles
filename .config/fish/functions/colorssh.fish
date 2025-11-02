function colorssh
    kitty @ set-colors ~/.config/kitty/themes/remote.conf
    pingssh $argv
    kitty @ set-colors ~/.config/kitty/themes/Wez.conf
end
