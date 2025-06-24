cd ~
wget https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2-linux-x86_64.tar.gz
tar -xf cmake-3.25.2-linux-x86_64.tar.gz

# Add to PATH for current session
export PATH=~/cmake-3.25.2-linux-x86_64/bin:$PATH

# Confirm version
cmake --version
