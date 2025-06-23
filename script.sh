#!/bin/bash

echo "Installing dependencies for the SLAM library..."

# Update package list
sudo apt update

# Install C++11 compiler and common tools
sudo apt install -y build-essential cmake git pkg-config

# Install Python and NumPy
sudo apt install -y python2.7-dev python-numpy

# Install Pangolin dependencies
sudo apt install -y libglew-dev libpython2.7-dev libboost-all-dev \
                    libeigen3-dev ffmpeg libjpeg-dev libpng-dev \
                    libtiff-dev libopenexr-dev libxi-dev libxxf86vm-dev \
                    libdc1394-22-dev libraw1394-dev libv4l-dev

# Clone and build Pangolin
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
cd ../..

# Install OpenCV (using APT for simplicity)
sudo apt install -y libopencv-dev

# Install Eigen3
sudo apt install -y libeigen3-dev

echo "All dependencies installed. DBoW2 and g2o are assumed to be in the Thirdparty folder."
