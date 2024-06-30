# echo pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel
# echo https://cloud.vast.ai/?ref_id=143095&template_id=f3db7d14eea13e128908b36395688679



apt-get install -y libgl1-mesa-glx
# apt-get install -y gcc

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
