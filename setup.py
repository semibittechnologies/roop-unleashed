#!/usr/bin/env python3
import os
import sys
import shutil
import urllib as urllib
import urllib.request as request

from tqdm import tqdm


def resolve_relative_path(path) -> str:
    return os.path.abspath(os.path.join(os.path.dirname(__file__), path))

def conditional_download(download_directory_path, urls) -> None:
    if not os.path.exists(download_directory_path):
        os.makedirs(download_directory_path)
    for url in urls:
        download_file_path = os.path.join(
            download_directory_path, os.path.basename(url)
        )
        if not os.path.exists(download_file_path):
            req = request.urlopen(url)  # type: ignore[attr-defined]
            total = int(req.headers.get("Content-Length", 0))
            with tqdm(
                total=total,
                desc=f"Downloading {url}",
                unit="B",
                unit_scale=True,
                unit_divisor=1024,
            ) as progress:
                request.urlretrieve(url, download_file_path, reporthook=lambda count, block_size, total_size: progress.update(block_size))  # type: ignore[attr-defined]

def pre_check() -> bool:
    if sys.version_info < (3, 9):
        print('Python version is not supported - please upgrade to 3.9 or higher.')
        return False
    
    download_directory_path = resolve_relative_path('./models')
    conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/inswapper_128.onnx'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/GFPGANv1.4.onnx'])
    # conditional_download(download_directory_path, ['https://github.com/csxmli2016/DMDNet/releases/download/v1/DMDNet.pth'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/GPEN-BFR-512.onnx'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/restoreformer_plus_plus.onnx'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/xseg.onnx'])
    # download_directory_path = resolve_relative_path('./models/CLIP')
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/rd64-uni-refined.pth'])
    # download_directory_path = resolve_relative_path('./models/CodeFormer')
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/CodeFormerv0.1.onnx'])
    # download_directory_path = resolve_relative_path('./models/Frame')
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/deoldify_artistic.onnx'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/deoldify_stable.onnx'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/isnet-general-use.onnx'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/real_esrgan_x4.onnx'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/real_esrgan_x2.onnx'])
    # conditional_download(download_directory_path, ['https://huggingface.co/countfloyd/deepfake/resolve/main/lsdir_x4.onnx'])
    if not shutil.which('ffmpeg'):
       print('ffmpeg is not installed.')
       return False
    print('ffmpeg path:')
    print(str(shutil.which('ffmpeg')))
    print('Setup Completed')
    return True
    
pre_check()
