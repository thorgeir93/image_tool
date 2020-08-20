# image_tool

## Install
Link the bash file `img`, located in this repository, to the `/usr/bin/img` so the the command `img` will be available in the terminal.
```
ln -s /home/thorgeir/github/thorgeir/image_tool/img /usr/bin/img
```
After running the above command, you can open a new terminal and run `img -h` to get started.

## import_photos.sh
Run `bash import_photos.sh` after you have connect your camera to your Linux PC.

### Requirements (third party libraries)
- gphoto2


# Handy commands
Find all files that were last changed 60 minutes ago and view them in feh.
Handy for newly inserted photos.
```
feh -F $(find . -type f -cmin -30)
```

# Notes
## Install `xnconvert` on centos
```
sudo yum install qt5-qtbase-gui
wget -c download.xnview.com/XnConvert-linux.x86_64.rpm
sudo rpm -i XnConvert-linux.x86_64.rpm
```

## Install `libheif` on centos (version2)
```
# Install libde265 first
git clone --single-branch --branch frame-parallel https://github.com/strukturag/libde265.git
cd libde265
./autogen.sh
./configure
make
sudo make install
# or just yum install libde265

# TODO let libde265 be visable for the libheif ./configure command.


# Install x256
sudo yum install x256

# Then Install libheif 
git clone https://github.com/strukturag/libheif.git
cd libheif
./autogen.sh
export PKG_CONFIG_PATH=/usr/local/lib && ./configure
make
sudo make install
```
