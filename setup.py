#!/usr/bin/env python3
import os
import sys
import shutil
import shutil
import roop.utilities as util

def pre_check() -> bool:
    if sys.version_info < (3, 9):
        print('Python version is not supported - please upgrade to 3.9 or higher.')
        return False
    
    download_directory_path = util.resolve_relative_path('./models')
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/inswapper_128.onnx'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/GFPGANv1.4.onnx'])
    util.conditional_download(download_directory_path, ['https://github.com/csxmli2016/DMDNet/releases/download/v1/DMDNet.pth'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/GPEN-BFR-512.onnx'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/restoreformer_plus_plus.onnx'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/xseg.onnx'])
    download_directory_path = util.resolve_relative_path('./models/CLIP')
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/rd64-uni-refined.pth'])
    download_directory_path = util.resolve_relative_path('./models/CodeFormer')
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/CodeFormerv0.1.onnx'])
    download_directory_path = util.resolve_relative_path('./models/Frame')
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/deoldify_artistic.onnx'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/deoldify_stable.onnx'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/isnet-general-use.onnx'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/real_esrgan_x4.onnx'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/real_esrgan_x2.onnx'])
    util.conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/lsdir_x4.onnx'])
    if not shutil.which('ffmpeg'):
       update_status('ffmpeg is not installed.')
    print('ffmpeg path:')
    print(str(shutil.which('ffmpeg')))
    print('Setup Completed')
    return True
    
pre_check()
