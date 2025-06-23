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


#!/bin/bash

echo "Installing dependencies..."

# Update and install dev tools
sudo apt update
sudo apt install -y build-essential cmake git pkg-config \
    libgtk-3-dev libavcodec-dev libavformat-dev libswscale-dev \
    libv4l-dev libxvidcore-dev libx264-dev libjpeg-dev libpng-dev \
    libtiff-dev gfortran openexr libatlas-base-dev \
    python2.7-dev python-numpy libtbb2 libtbb-dev \
    libdc1394-22-dev

# Download OpenCV 4.4.0
cd ~
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 4.4.0

# Download OpenCV contrib (optional)
cd ~
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 4.4.0

# Build OpenCV
cd ~/opencv
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..
make -j$(nproc)
sudo make install
sudo ldconfig

echo "✅ OpenCV 4.4.0 installed successfully."
