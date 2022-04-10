########
## Installing wine 
## source: https://wiki.winehq.org/Ubuntu
######
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

## enabled for 21.04 check the winehq source for different versions
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'

#Ubuntu 21.10	sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main'
#Ubuntu 21.04	sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'
#Ubuntu 20.10	sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main'
#Ubuntu 20.04  sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
#Ubuntu 18.04  sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'


sudo apt update
sudo apt install --install-recommends winehq-staging


########
## exports
####
export MIR4_BASEDIR=$HOME/GAMES/MIR4-00
export MIR4_INSTALLDIR=$MIR4_BASEDIR/MIR
export MIR4_CACHE=$MIR4_BASEDIR/CACHE
export MIR4_FILES=$MIR4_BASEDIR/LAUNCHER
export MIR4_DXVK=$MIR4_BASEDIR/DXVK

########
## WinePrefix
####
mkdir -p $MIR4_INSTALLDIR
mkdir -p $MIR4_CACHE
mkdir -p $MIR4_FILES
mkdir -p $MIR4_DXVK

########
## download the last launcher (Windows)
## The one here is the latest as in today, grab a new one from: https://www.eveonline.com/download
####
wget -P $MIR4_LAUNCHER https://live-dl.mir4global.com/global-launcher/Mir4Launcher_Install.exe

########
## Setup WINEPREFIX
####
WINEPREFIX=$MIR4_INSTALLDIR WINEARCH="win32" winecfg

########
## dxvk
####
wget https://github.com/doitsujin/dxvk/releases/download/v1.10.1/dxvk-1.10.1.tar.gz -O $MIR4_FILES/dxvk.tar.gz
tar -xvf $MIR4_FILES/dxvk.tar.gz -C $MIR4_DXVK
WINEPREFIX=$MIR4_INSTALLDIR $MIR4_DXVK/dxvk-1.10.1/setup_dxvk.sh install

########
## (Optional) Other personal setting (only for me)
####
export LD_PRELOAD=""

######
## install the game
## Remeber to update the filename of the launcher you downloaded
####
WINEPREFIX=$MIR4_INSTALLDIR wine $MIR4_FILES/Mir4Launcher_Install.exe

######
## Run Launcher
####
WINEDEBUG=-all WINEPREFIX=$MIR4_INSTALLDIR wine C:\\\\Wemade\\Mir4Global\\Mir4Launcher\\Mir4Launcher.exe


