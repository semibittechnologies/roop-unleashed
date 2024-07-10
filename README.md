---
title: Roop Docker
emoji: ⚡
colorFrom: blue
colorTo: pink
sdk: docker
pinned: false
---

Check out the configuration reference at https://huggingface.co/docs/hub/spaces-config-reference

Check out the configuration reference at https://huggingface.co/docs/hub/spaces-config-reference

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
