FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel

# Copy all files from the current directory to /root/roop-unleashed
COPY . /root/roop-unleashed

# Set the working directory
WORKDIR /root/roop-unleashed

# Run the setup.sh script
RUN export PATH=/ffmpeg/ffmpeg-7.0.1-amd64-static:$PATH
RUN chmod +x setup.sh && ./setup.sh
RUN export PATH=/ffmpeg/ffmpeg-7.0.1-amd64-static:$PATH

EXPOSE 7860
EXPOSE 7861
EXPOSE 8888
# Command to run JupyterLab and the Python script on startup
CMD jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password='' --allow-root
 # & python run.py
