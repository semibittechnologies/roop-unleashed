add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update


apt-get install -y python3.11 python3.11-venv python3.11-dev libgl1-mesa-glx ffmpeg
ln -sf /usr/bin/python3.11 /usr/bin/python && \
    ln -sf /usr/bin/python3.11 /usr/bin/python3
    
python --version
git clone https://github.com/C0untFloyd/roop-unleashed
cd /roop-unleashed
pip3 install -r requirements.txt
