# echo pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel
add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update


apt-get install -y python3.11 python3.11-venv python3.11-dev libgl1-mesa-glx screen
ln -sf /usr/bin/python3.11 /usr/bin/python && \
    ln -sf /usr/bin/python3.11 /usr/bin/python3
wget https://bootstrap.pypa.io/get-pip.py && \
    python3.11 get-pip.py && \
    rm get-pip.py
mkdir /ffmpeg
cd ffmpeg 
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
unxz ffmpeg-release-amd64-static.tar.xz
tar -xvf ffmpeg-release-amd64-static.tar
export PATH=/ffmpeg/ffmpeg-7.0.1-amd64-static:$PATH

python --version
pip3 install -r requirements.txt
