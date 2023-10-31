#!/bin/sh

wf-recorder -a --audio=alsa_output.usb-Macronix_Razer_Barracuda_X_2.4_1234-00.pro-output-0.monitor -o DP-1 -f $HOME/recorded.mkv &
sleep 5
cmus-remote -p
sleep 2
exec foot -e termshark -i lo &
sleep 2
exec foot -e gping 127.0.0.1 &
sleep 2
exec foot -e mapscii &
sleep 2
exec hyprctl dispatch workspace 8 &
sleep 4
exec foot -e ~/Programs/Builds/hollywood/bin/hollywood &
sleep 15
exec mpv --no-audio https://www.youtube.com/watch?v=iEDMWm0G3Io &
sleep 2
exec mpv --no-audio https://www.youtube.com/watch?v=QDNaHsHTnkA &
sleep 2
hyprctl dispatch movefocus l &
sleep 1
exec mpv --no-audio https://www.youtube.com/watch\?v\=GmMgTZdmALU &
sleep 15
exec hyprctl dispatch workspace 2 &
sleep 6
exec hyprctl dispatch workspace 8 &
sleep 10
hyprctl dispatch killactive &
sleep 1 
hyprctl dispatch killactive &
sleep 1 
hyprctl dispatch killactive &
sleep 1 
hyprctl dispatch killactive &
sleep 1 
exec hyprctl dispatch workspace 2 &
sleep 5
hyprctl dispatch killactive &
sleep 1 
hyprctl dispatch killactive &
sleep 1 
hyprctl dispatch killactive &
sleep 1 
cmus-remote -s &
sleep 1
pkill termshark &
sleep 1
pkill wf-recorder
