#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
##################################################################################################################
tput setaf 1
echo "###############################################################################"
echo "#                        !!! Dteam Deck Restore Tool !!!                      #"
echo "###############################################################################"
tput sgr0
echo
echo "Hello $USER, Please Choose wisely."
echo
echo "1.  Unlock & Populate Arch Keys"
echo "2.  Prepare & Re-Install Required Apps"
echo "3.  Fix Theming & Re-Apply Optional Rice"
echo
echo
echo "Please Select an Option..."
echo

read CHOICE

case $CHOICE in

    1 )
      echo "Unlocking system & Populating Keys"
      echo "##################################"
      echo
      echo "Unlockind the Damn Device"
      echo
      sudo steamos-readonly disable
      sleep 2
      echo
      echo "Populating Arch Keys"
      echo
      echo "keyserver hkps://keyserver.ubuntu.com" >> /etc/pacman.d/gnupg/gpg.conf
      sudo pacman-key --init
      sudo pacman-key --populate archlinux
      sudo pacman-key --refresh-keys
      echo
      cd ~ && wget https://archlinux.org/packages/core/any/archlinux-keyring/download -O archlinux-keyring-any.pkg.tar.zst && sudo pacman -U archlinux-keyring-any.pkg.tar.zst
      sleep 2
      echo
      echo "##################################"
      echo "  Done! You Can Install Shit Now  "
      echo "##################################"
      sleep 3

      ;;

    2 )
      echo "Prepping & Installing Your Needed Apps"
      echo "######################################"
      echo
      echo "Deleting Files Before Proceeding"
      sleep 2
      sudo rm /etc/fonts/conf.avail/75-noto-color-emoji.conf
      sudo rm /etc/fonts/conf.d/75-noto-color-emoji.conf
      sudo rm /etc/security/limits.d/99-realtime-privileges.conf
      sudo rm /etc/xdg/menus/applications-merged/wine.menu
      sudo rm /etc/gtk-2.0/im-multipress.conf
      sudo rm -Rf /opt/vivaldi/
      sudo rm -Rf /etc/skel/
      rm -rf ~/.oh-my-zsh/
      echo
      echo "All Done, moving to next step"
      sleep 2
      echo
      echo "Clearing up the Pacman Cache & Running Update"
      echo
      sudo pacman -Scc && sudo pacman -Syyu xero-fix-scripts --noconfirm --needed
      sleep 2
      echo
      echo "Installing your apps now..."
      echo
      packages="nomachine xerowelcome latte-dock-git wine-meta neofetch gtk-engine-murrine gtk-engines vivaldi vivaldi-ffmpeg- codecs topgrade meld yakuake ttf-fira-code otf-libertinus tex-gyre-fonts awesome-terminal-fonts kde-wallpapers lightly-git gst-plugins-good lib32-gst-plugins-good phonon-qt5-gstreamer dolphin-plugins cmake ninja meson yay-bin siji-git ttf-unifont noto-color-emoji-fontconfig xorg-fonts-misc ttf-dejavu ttf-meslo-nerd-font-powerlevel10k noto-fonts-emoji powerline-fonts ffmpeg"
      for package in $packages; do
          pacman -Qi "$package" > /dev/null 2>&1 || sudo pacman -Syy --noconfirm --needed "$package" > /dev/null 2>&1
      done
      keyfix
      sleep 2
      echo
      echo "##################################"
      echo "     You Can Apply Rice Now       "
      echo "##################################"
      sleep 3

      ;;

    3 )
      echo "Re-Applying Rice Reboot Needed "
      echo "#####################################"
      echo
      echo "Enabling Flatpak Theming Overrides"
      echo
      sudo flatpak override --filesystem=$HOME/.themes
      sudo flatpak override --filesystem=xdg-config/gtk-4.0:ro
      sudo flatpak override --filesystem=xdg-config/gtk-3.0:ro
      echo
      sleep 2
      echo "Cloning & Installing Selected Rice"
      echo
      cd ~ && git clone https://github.com/xerolinux/xero-sweet-git.git && cd xero-sweet-git && sh install.sh
      sleep 2
      echo
      echo "####################################"
      echo "     Done! Reboot Now or else !     "
      echo "####################################"
      sleep 3

      ;;

    * )
      echo "#################################"
      echo "    Choose the correct answer    "
      echo "#################################"
      ;;
esac
