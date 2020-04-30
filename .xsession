[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
~/.fehbg &
blueman-applet &
dunst &
CM_MAX_CLIPS=50 CM_SELECTIONS="clipboard primary" clipmenud &
picom -b
