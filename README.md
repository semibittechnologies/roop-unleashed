---
title: Roop Docker
emoji: ⚡
colorFrom: blue
colorTo: pink
sdk: docker
pinned: false
---

## Docker
```
docker run -p 8888:8888 semibit/roop-unleashed:latest
jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --allow-root
```
Open http://localhost:8888

In jupyterlab run
```
export PATH=/ffmpeg/ffmpeg-7.0.1-amd64-static:$PATH
echo Please update the creds in ul.py
python run.py
```

Local inputs `/root/roop-unleashed/inputs`

## Vast AI

Use image `pytorch/pytorch:2.2.0-cuda11.8-cudnn8-runtime  2.2.0-cuda11.8-cudnn8-runtime`

```
apt-get install -y htop screen && pip install jupyterlab  && git clone https://github.com/semibittechnologies/roop-unleashed
screen

jupyter lab --allow-root && sleep 2 && jupyter lab list
sh setup.sh
export PATH=/ffmpeg/ffmpeg-7.0.1-amd64-static:$PATH
python run.py
```
