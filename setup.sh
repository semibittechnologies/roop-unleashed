# echo pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel
# echo https://cloud.vast.ai/?ref_id=143095&template_id=f3db7d14eea13e128908b36395688679

# Latest: https://cloud.vast.ai/templates/edit?templateHashId=59c8b73967e217815f5b99ea5d80d2a5
# 11329925
# Poland, PL
# 2x RTX A400041.3  TFLOPS
# m:18551
# host:78246
# verified
# 1.6/32.0 GB
# 364.1 GB/s
# PRIME B365
# PCIE 3.0, 16x
# 12.4 GB/s
# Pentium® Gold G5420
# 4.0/4 cpu
# 2/32 GB
# Lexar SSD NM620 1TB
# 553 MB/s6.0/30.3 GB
# 594.9 Mbps350.4 MbpsMax CUDA: 12.2





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

apt-get install -y htop screen libgl1-mesa-glx
pip install jupyterlab 
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
python setup.py

jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password='' 
