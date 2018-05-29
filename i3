set $mod Mod4

font pango:Fira Mono Medium 10
floating_modifier $mod

gaps inner 4

exec sh ~/.xinit_local

# Window management
bindsym $mod+Shift+q       kill
bindsym $mod+h       focus left
bindsym $mod+j       focus down
bindsym $mod+k       focus up
bindsym $mod+l       focus right
bindsym $mod+Shift+h move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+j move up
bindsym $mod+Shift+l move right
#bindsym $mod+h       split h
#bindsym $mod+v       split v
bindsym $mod+f       fullscreen toggle
bindsym $mod+s       layout stacking
bindsym $mod+w       layout tabbed
bindsym $mod+e       layout toggle split
bindsym $mod+Shift+space floating toggle
bindsym $mod+space   focus mode_toggle
bindsym $mod+a       focus parent

# execs
bindsym $mod+Return          exec urxvtc
bindsym $mod+Shift+Return    exec i3-sensible-terminal
bindsym $mod+d               exec dmenu_run
bindsym --release $mod+XF86Explorer    exec systemctl suspend && killall ssh
bindsym XF86Tools            exec terminology -e mc
bindsym $mod+XF86Tools       exec killall xinit
bindsym Shift+XF86Tools      exec pcmanfm

# Volume
bindsym XF86AudioLowerVolume exec amixer -q sset Master 8%-     && pkill -SIGRTMIN+10 i3blocks
bindsym XF86AudioMute        exec amixer -q sset Master toggle  && pkill -SIGRTMIN+10 i3blocks
bindsym XF86AudioRaiseVolume exec amixer -q sset Master 8%+     && pkill -SIGRTMIN+10 i3blocks

# Xorg
bindsym $mod+F6 exec xrandr --output eDP1 --brightness 0.6 && pkill -SIGRTMIN+13 i3blocks
bindsym $mod+F7 exec xrandr --output eDP1 --brightness 1.0 && pkill -SIGRTMIN+13 i3blocks
bindsym XF86MonBrightnessDown exec xrandr --output eDP-1 --brightness 0.6 && pkill -SIGRTMIN+13 i3blocks
bindsym XF86MonBrightnessUp   exec xrandr --output eDP-1 --brightness 1.0 && pkill -SIGRTMIN+13 i3blocks

# Keyboard Layout
bindsym $mod+Shift+n         exec setxkbmap -option caps:hyper de && pkill -SIGRTMIN+11 i3blocks
bindsym $mod+Shift+m         exec setxkbmap -option caps:hyper us && pkill -SIGRTMIN+11 i3blocks

# i3
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# Workspaces
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

new_window none
for_window [class="VirtualBox"] floating true

mode "resize" {
        bindsym h resize shrink width  10 px or 10 ppt
        bindsym j resize grow   height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow   width  10 px or 10 ppt
        bindsym Return mode "default"
        bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

bar {
        status_command i3blocks
        #status_command ~/git/i3blocks/i3blocks
        #mode hide
        position top
}
# vim: ft=sh
