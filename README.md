# Important 
Create a virtual environment with python = 3.8 and activate the environment before running this bash script <br>
Why? Because it'll be easier to manage packages
# One click DeepStream Installation on dGPU type device
1. Clone the repo <br>
2. Make sure setup.sh and deepstream_sdk_v6.2.0_x86_64.tbz file are in the same directory <br>
3. Make sure conda is installed in your device. <br>
4. Run `sudo chmod +x setup.sh` <br>
5. Run `./setup.sh`
   
# One click DeepStream Installation on jetson type device
1. Clone the repo <br>
2. Make sure jetson_setup.sh and deepstream_sdk_v6.2.0_jetson.tbz2 file are in the same directory <br>
3. Make sure conda is installed in your device. <br>
4. Run `sudo chmod +x jetson_setup.sh` <br>
5. Run `./setup.sh`

# About
This repo contains a shell script to install Nvidia DeepstreamSDK v6.2 and all its dependencies along with Python bindings for both dGPU and jetson type devices.  <br>

