#!/bin/bash

sudo apt update

sudo apt install -y feh dex xdg-utils screenfetch scrot picom wmname gnome-keyring seahorse
sudo apt install -y xbacklight xserver-xorg-input-synaptics cheese workrave
sudo apt install -y alsa-utils pulseaudio pulseaudio-alsa pulseaudio-module-bluetooth pavucontrol pulsemixer
sudo apt install -y network-manager network-manager-gnome arandr
sudo apt install -y pcmanfm gvfs udiskie xarchiver mc ranger
sudo apt install -y kitty tmux policykit-1
sudo apt install -y vim neovim neovim-qt python3-neovim emacs firefox chromium-browser putty remmina goldendict
sudo apt install -y fcitx fcitx-googlepinyin fcitx-config-gtk
sudo apt install -y openjdk-11-jdk openjdk-11-doc
sudo apt install -y nmap openssh-client aria2 wget silversearcher-ag
sudo apt install -y fonts-bitstream-vera fonts-croscore fonts-dejavu fonts-droid fonts-roboto fonts-noto fonts-liberation fonts-ubuntu
sudo apt install -y fonts-anonymous-pro fonts-freefont-ttf fonts-source-code-pro fonts-linuxlibertine fonts-source-sans-pro
sudo apt install -y fonts-noto-cjk fonts-noto-cjk-extra

sudo apt install -y xclip xsel clipit
sudo apt install -y xfce4 xfce4-goodies

sudo apt install -y mpd mpc ncmpcpp xfmpc

# Installing additional packages from external repositories
sudo add-apt-repository -y ppa:canonical-chromium-builds/stage
sudo apt-get update
sudo apt-get install -y chromium-browser

# Installing additional packages using AUR helper (aura)
sudo apt install -y git
git clone https://aur.archlinux.org/aura.git
cd aura
makepkg -si --noconfirm
cd ..
rm -rf aura
aura -Ax --needed --noconfirm rstudio-desktop-bin
aura -Ax --needed --noconfirm stardict-oald stardict-wordnet dict-wn dict-foldoc

