#!/bin/bash

echo "This will set up DWM."
pacman -S --needed alacritty base-devel ttf-font-awesome ttf-fira-code
sleep 2s
mkdir /usr/share/xsessions/
cp dwm.desktop /usr/share/xsessions/

echo "What is your username?"
read USERNAME
 
ln -s /home/$USERNAME/dwm-config/dwm/ /usr/local/
ln -s /home/$USERNAME/dwm-config/dmenu/ /usr/local/
ln -s /home/$USERNAME/dwm-config/slstatus/ /usr/local/
ln -s /home/$USERNAME/dwm-config/st/ /usr/local/
cd usr/local/dwm && make clean install && cd ..
cd dmenu && make clean install && cd ..
cd slstatus && make clean install && cd ..
cd st && make clean install && cd ..

pacman -S --needed nitrogen

echo "exec dwm &
nitrogen --restore &
slstatus &" > /home/$USERNAME/.profile

echo "DWM successfully installed!"
