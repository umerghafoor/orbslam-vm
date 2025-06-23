#!/bin/bash

echo "Installing Eigen 3.3.1..."

# Go to home directory
cd ~

# Download Eigen 3.3.1
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.1/eigen-3.3.1.tar.gz

# Extract
tar -xvzf eigen-3.3.1.tar.gz
cd eigen-3.3.1

# Build and install
mkdir build && cd build
cmake ..
sudo make install

echo "✅ Eigen 3.3.1 installed to /usr/local/include/eigen3"
