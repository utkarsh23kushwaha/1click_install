#!/bin/bash
​
if command -v conda &> /dev/null; then
    echo "Conda is installed. Continuing with the process..."
    # Add your package installation commands here
else
    echo "Conda is not installed. Please install Conda and run the script again."
    exit 1  # Exit the script with a non-zero status code
fi
​
conda create -n deepstreamenv python=3.8 
conda activate deepstreamenv
​
​
sudo apt install \
libssl1.1 \
libgstreamer1.0-0 \
gstreamer1.0-tools \
gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad \
gstreamer1.0-plugins-ugly \
gstreamer1.0-libav \
libgstreamer-plugins-base1.0-dev \
libgstrtspserver-1.0-0 \
libjansson4 \
libyaml-cpp-dev \
libjsoncpp-dev \
protobuf-compiler \
gcc \
make \
git 
​
sudo apt-get install gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
sudo apt-get install libgstreamer1.0-0 gstreamer1.0-dev gstreamer1.0-tools gstreamer1.0-doc

​
if [ ! -f deepstream_sdk_v6.2.0_jetson.tbz2 ]; then
    echo "deepstream_sdk_v6.2.0_jetson.tbz2 not found in the current directory."
    echo "Please download deepstream_sdk_v6.2.0_jetson.tbz2 in the current directory and run the script again."
    exit 1  # Exit the script with a non-zero status code
fi 
​
sudo tar -xvf deepstream_sdk_v6.2.0_jetson.tbz2 -C /
cd /opt/nvidia/deepstream/deepstream-6.2/
sudo ./install.sh
sudo ldconfig
​
sudo apt install python3-gi python3-dev python3-gst-1.0 python-gi-dev git python-dev \
python3 python3-pip python3.8-dev cmake g++ build-essential libglib2.0-dev \
libglib2.0-dev-bin libgstreamer1.0-dev libtool m4 autoconf automake libgirepository1.0-dev libcairo2-dev
​
cd /opt/nvidia/deepstream/deepstream-6.2/sources
sudo git clone https://github.com/NVIDIA-AI-IOT/deepstream_python_apps
cd /opt/nvidia/deepstream/deepstream/sources/deepstream_python_apps/
sudo git submodule update --init
sudo apt-get install -y apt-transport-https ca-certificates -y
sudo update-ca-certificates
cd 3rdparty/gst-python/
sudo ./autogen.sh
sudo make
sudo make install
​
cd deepstream_python_apps/bindings
sudo mkdir build
cd build
sudo cmake ..  -DPYTHON_MAJOR_VERSION=3 -DPYTHON_MINOR_VERSION=8 \
    -DPIP_PLATFORM=linux_aarch64 -DDS_PATH=/opt/nvidia/deepstream/deepstream/
sudo make
​
sudo pip3 install ./pyds-1.1.6-py3-none*.whl


