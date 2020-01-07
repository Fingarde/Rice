#!/bin/bash

if [ ! $(basename $(pwd)) = "Rice" ]; then
    printf "\033[1;31mYou need to be in the folder Rice/\033[0m\n"
    exit 1
fi

if [ ! $UID = "0" ]; then
    printf "\033[1;31mYou need to be root\033[0m\n"
    exit 1
fi

mv /etc/apt/sources.list /etc/apt/sources.list.old
while read line; do
    if echo $line | grep -v "^#" | grep -v "contrib" > /dev/null; then
        line=$(echo $line | sed "s/main/main contrib non-free/g")
    fi
    echo $line >> /etc/apt/sources.list
done < /etc/apt/sources.list.old

apt update

apt install sudo
sudo adduser $USER

apt install -y lightdm
apt install -y xorg i3
apt install -y pulseaudio pavucontrol alsa-utils
apt install -y wicd-gtk
apt install -y feh xfce4-screenshooter

apt install -y zsh kitty
apt install -y curl psmisc

chsh -s /bin/zsh $USER
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

apt install fonts-noto-color-emoji

if [ ! -f "Discord.deb" ]; then
    wget -O Discord.deb https://discordapp.com/api/download?platform=linux&format=deb
    
    dpkg -i Discord.deb
    apt --fix-broken install
    dpkg -i Discord.deb
fi

if [ ! -f "VisualStudio-Code.deb" ]; then
    wget -O VisualStudio-Code.deb https://go.microsoft.com/fwlink/?LinkID=760868
    
    dpkg -i VisualStudio-Code.deb
    apt --fix-broken install
    dpkg -i VisualStudio-Code.deb
fi

if [ ! -f "Idea.tar.gz" ]; then
    wget -O Idea.tar.gz https://download.jetbrains.com/idea/ideaIU-2019.3.1.tar.gz
    
    tar xzf Idea.tar.gz
    mv Idea /opt/idea
fi

if [ ! -f "Minecraft.deb" ]; then
    wget -O Minecraft.deb https://launcher.mojang.com/download/Minecraft.deb

    dpkg -i Minecraft.deb
    apt --fix-broken install
    dpkg -i Minecraft.deb
fi

apt install libreoffice

sudo update-pciids
if lspci | grep -i "vga\|3d\|2d" | grep "GeForce GTX 1060 6GB" > /dev/null; then
    echo PC Fixe
else
    echo PC Portable
fi    


sudo apt install cmake unifont cairo-5c libxcb1-dev python xcb-proto libxcb-util0-dev libxcb-xrm-dev libxcb-cursor-dev libxcb-image0-dev   
git clone https://github.com/stark/siji
cd siji
./install.sh
cd ../

wget -O Polybar.tar https://github.com/polybar/polybar/releases/download/3.4.2/polybar-3.4.2.tar
tar xvf Polybar.tar
cd polybar
./build.sh
cd ../



chown -R $USER:$USER ~$USER/*
chown -R $USER:$USER ~$USER/.*
