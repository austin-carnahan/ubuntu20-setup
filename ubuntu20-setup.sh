#!bin/bash

# Freshen up
apt-add-repository universe
apt update && apt upgrade -y

# Utilities
###########################################
###########################################

apt install synaptic ffmpeg unzip curl tlp git zsh terminator

# Set up directories
mkdir Code


# TODO!
# Enable multi-touch gestures

# Uncomment below to disable wifi powersaving... not sure if this works
# sudo sed -i "s/wifi.powersave = 3/wifi.powersave = 2/g" /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf

# Internet
############################################
############################################

# Chrome
sudo apt install apt-transport-https

cd Downloads

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

dpkg -i google-chrome-stable_current_amd64.deb

cd ..

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

# VPN
cd Downloads

wget -O pia-installer.run https://installers.privateinternetaccess.com/download/pia-linux-3.3-06906.run

sh pia-installer.run

cd ..

# Appearance
###########################################
###########################################
apt install gnome-tweaks, sassc, optipng, inkscape, libglib2.0-dev-bin, chrome-gnome-shell

cd .. && mkdir .themes && mkdir .icons
cd .themes
# Add theme download here...
git clone https://github.com/vinceliuice/Mojave-gtk-theme.git

cd Mojave-gtk-theme

./install.sh

cd ..

# install user themes extension
# https://extensions.gnome.org/extension/19/user-themes/

# install dash to dock extension
# https://extensions.gnome.org/extension/307/dash-to-dock/

cd .. && cd .icons

git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git

cd ..

## TODO: Enable extensions programatically!
gsettings set org.gnome.desktop.interface gtk-theme "Mojave-dark"
gsettings set org.gnome.desktop.interface font-name "Garuda 11"
gsettings set org.gnome.desktop.interface show-battery-percentage true 
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false      
# gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "FIXED"
# gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.10  



# Programming Tools
############################################
############################################

# ZSH Config
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ..

sed -i 's/robbyrussell/simple/' .zshrc


# VSCode
cd .. && cd/Downloads

wget -O latest-vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

apt install ./latest-vscode.deb

cd ..

# Git
git config --global user.name "austin"
git config --global user.email ac6404@gmail.com
git config --global core.editor vi

# SSH
ssh-keygen -t ed25519 -C "ac6404@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
touch ~/Desktop/ssh.txt
cat ~/.ssh/id_ed25519.pub >> ~/Desktop/ssh.txt

# Node
sudo snap install node --classic

# Apps
############################################
#########################################3##
apt install mypaint openshot peek

cd Downloads

wget -O zoom-installer.deb https://zoom.us/client/latest/zoom_amd64.deb

sudo apt install ./zoom-installer.deb

cd ..

snap install slack --classic

snap install spotify
# SSH
ssh-keygen -t ed25519 -C "ac6404@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
touch ~/Desktop/ssh.txt
cat ~/.ssh/id_ed25519.pub >> ~/Desktop/ssh.txt

# Apps
############################################
#########################################3##
apt install mypaint openshot peek

cd Downloads

wget -O zoom-installer.deb https://zoom.us/client/latest/zoom_amd64.deb

sudo apt install ./zoom-installer.deb

snap install gimp

snap install vlc

# Security
#############################################
#############################################

ufw default allow outgoing
ufw default deny incoming
ufw allow ssh
ufw logging low
