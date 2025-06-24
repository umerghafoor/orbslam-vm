#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y cmake libglew-dev libpython2.7-dev \
    libboost-all-dev libxkbcommon-dev libxi-dev \
    libeigen3-dev ffmpeg libavcodec-dev libavutil-dev \
    libavformat-dev libswscale-dev libjpeg-dev libpng-dev \
    libtiff-dev libopenexr-dev zlib1g-dev

# Clone Pangolin
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin

# Build
mkdir build
cd build
cmake ..
make -j$(nproc)

# Install
sudo make install
