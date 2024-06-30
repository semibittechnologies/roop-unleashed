# echo pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel
# echo https://cloud.vast.ai/?ref_id=143095&template_id=f3db7d14eea13e128908b36395688679

# Latest: https://cloud.vast.ai/templates/edit?templateHashId=59c8b73967e217815f5b99ea5d80d2a5
# 11329799
# Age:
# 8m 23s
# Remaining:
# 3 days
# Poland, PL
# 1x RTX A400020.6  TFLOPS
# m:18119
# host:78246
# verified
# 0.3/16.0 GB
# 362.5 GB/s
# B550
# PCIE 4.0, 16x
# 24.8 GB/s
# AMD Ryzen 5 5600X 6-Core Processor
# 6.0/12 cpu
# 0/16 GB
# PNY CS3140 1TB SSD
# 1273 MB/s4.0/30.3 GB
# 534.0 Mbps347.1 MbpsMax CUDA: 12.2



apt-get install -y libgl1-mesa-glx
# apt-get install -y gcc g++

# add-apt-repository ppa:deadsnakes/ppa -y &&  apt-get update
# apt-get install -y python3.11 python3.11-venv python3.11-dev
# ln -sf /usr/bin/python3.11 /usr/bin/python && \
#     ln -sf /usr/bin/python3.11 /usr/bin/python3

# ln -sf /usr/bin/python3.11 /opt/conda/bin/python && \
#     ln -sf /usr/bin/python3.11 /opt/conda/bin/python3
    
# wget https://bootstrap.pypa.io/get-pip.py && \
#     python3.11 get-pip.py && \
#     rm get-pip.py

apt-get install -y htop   
mkdir /ffmpeg
cd /ffmpeg && wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && unxz ffmpeg-release-amd64-static.tar.xz && tar -xvf ffmpeg-release-amd64-static.tar 
export PATH=/ffmpeg/ffmpeg-7.0.1-amd64-static:$PATH

python --version
pip show torch
pip show torchvision
cd /root/roop-unleashed
mkdir inputs
mkdir outputs
pip3 install -r gpu-requirements.txt
python run.py
