#!/bin/sh

read -e -p "Enter image path: " image
read -p "Enter backend (colorthief, colorz, haishoku or schemer): " backend
#wallpapers_string+="preload = ~/$image\n\nwallpaper = DP-3,~/$image\nwallpaper = DP-1,~/$image"

compile_theme(){
  wal -i $image --backend $backend
  wait
  #killall hyprpaper
  #echo -en "$wallpapers_string" > ~/.config/hypr/hyprpaper.conf
  #hyprpaper &
  swww img "$image" -t grow --transition-duration 4 --transition-fps 30 --transition-bezier 0.68,-0.6,0.32,1.6
  pywalfox update
  pywal-discord
  python ~/.config/OpenRGB/OpenWAL.py &
  ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc & pkill dunst
  dunst &
  killall waybar
  sleep 1
  waybar &
  oomox-cli /opt/oomox/scripted_colors/xresources/xresources-reverse
  sleep 1
  oomox-gnome-colors-icons-cli -o oomox-xresources-reverse -d ~/.icons/oomox-xresources-reverse /opt/oomox/scripted_colors/xresources/xresources-reverse
  sleep 1
} &> /dev/null

compile_theme
echo " "
echo "Theme update process complete."
