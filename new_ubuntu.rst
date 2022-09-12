

Connect to internet
*******************

nmcli device wifi list
nmcli device wifi connect <SSID> password <pwd>

Install packages
****************

sudo apt update
sudo apt install git make gcc libx11-dev libxinerama-dev
sudo apt install xbindkeys
sudo apt-get install -y dmenu

Insatll dwm
***********

git clone git@github.com:lunatikub/conf.git
cd conf/dwm-6.0
make
sudo make install
sudo systemctl set-default multi-user.target
cp ~/git/conf/config/xinitrc ~/.xinitrc
cp ~/git/conf/config/xmodmaprc ~/.xmodmaprc


Run X
*****

unlog
startx &> ~/Xoutput
