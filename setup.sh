# echo pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel
add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update


apt-get install -y python3.11 python3.11-venv python3.11-dev libgl1-mesa-glx ffmpeg screen
ln -sf /usr/bin/python3.11 /usr/bin/python && \
    ln -sf /usr/bin/python3.11 /usr/bin/python3
wget https://bootstrap.pypa.io/get-pip.py && \
    python3.11 get-pip.py && \
    rm get-pip.py

python --version
pip3 install -r requirements.txt
