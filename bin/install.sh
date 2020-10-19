#!/bin/sh
function check_distro {
    if [ -f /etc/arch-release ]; then
        check_for_yay
        wal
        polybar
        i3
        dunst
        finish
    else
        echo -e "\e[91mERROR\e[0m This script only supports Arch Linux."
    fi
}

function check_for_yay {
   if [ ! command -v yay0 -V &> /dev/null ]; then
       echo -e "\e[91mERROR\e[0m This script needs yay. Installing..."
       git clone https://aur.archlinux.org/yay.git /tmp/yay
       cd /tmp/yay
       makepkg -si
       echo -e "\e[92mINFO\e[0m Finished installing yay."
   fi
}

function wal {
  echo -e "\e[92mINFO\e[0m Installing pywal with \e[1mpip\e[21m"
  sudo pip3 install wal --quiet
  #wal -e ./wallpapers/warburton.jpg
  wget https://raw.githubusercontent.com/dylanaraps/pywal/master/pywal/colorschemes/dark/gruvbox.json -O ~/.cache/wal/schemes/gruvbox.json
  wal --theme ~/.cache/wal/schemes/gruvbox.json
  echo -e "\e[92mINFO\e[0m Finished installing pywal, and set theme!"
}

function polybar {
   echo -e "\e[92mINFO\e[0m Installing polybar with \e[1myay\e[21m"
   yay -S --quiet --noconfirm polybar
   echo -e "\e[92mINFO\e[0m Finished installing polybar!"
}

function i3 { 
  echo -e "\e[92mINFO\e[0m Installing i3-gaps with \e[1mpacman\e[21m"
  sudo pacman -S --quiet --noconfirm i3-gaps
  echo -e "\e[92mINFO\e[0m Finished installing i3-gaps!"
}

function dunst {
   echo -e "\e[92mINFO\e[0m Installing dunst with \e[1mpacman\e[21m"
   sudo pacman -S --quiet --noconfirm dunst libnotify
   echo -e "\e[92mINFO\e[0m Finished installing dunst!"
}

function finish {
   echo -e "\e[92mINFO\e[0m Finished installing CircuitRCAY's dotfiles!"
   exit
}

check_distro
