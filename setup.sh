# echo pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel
# echo https://cloud.vast.ai/?ref_id=143095&template_id=f3db7d14eea13e128908b36395688679

# Latest: https://cloud.vast.ai/templates/edit?templateHashId=59c8b73967e217815f5b99ea5d80d2a5

# 11454806
# Age:
# 16 min.
# Remaining:
# 21 days
# Sweden, SE
# 1x RTX A600036.1  TFLOPS
# m:21115
# host:102965
# verified
# 0.5/48.0 GB
# 622.0 GB/s
# MZ52
# PCIE 4.0, 8x
# 12.3 GB/s
# AMD EPYC 7532 32-Core Processor
# 8.0/64 cpu
# 3/64 GB
# INTEL SSDPE2KX080T8O
# 5671 MB/s7.0/30.3 GB
# 52.0 Mbps456.4 MbpsMax CUDA: 12.2
# GPU: 0% 30C , CPU: 33% Status: success, running pytorch/pytorch_2.1.2-cuda11.8-cudnn8-devel/ssh

# apt-get install -y gcc g++
 
# apt-get update
# apt-get install -y htop screen libgl1-mesa-glx wget
# pip install jupyterlab 
# mkdir /ffmpeg
# cd /ffmpeg && wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && unxz ffmpeg-release-amd64-static.tar.xz && tar -xvf ffmpeg-release-amd64-static.tar 
# export PATH=/ffmpeg/ffmpeg-7.0.1-amd64-static:$PATH

# python --version
# pip show torch
# pip show torchvision
# cd /root/roop-unleashed
# mkdir inputs
# mkdir outputs
# pip3 install -r gpu-requirements.txt
python setup.py

# jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password='' --allow-root
