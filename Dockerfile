# Use the base image with CUDA and Ubuntu
FROM nvidia/cuda:12.0.1-devel-ubuntu20.04

RUN apt-get update && apt-get install -y git wget curl
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && echo "Asia/Kolkata" > /etc/timezone

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies for adding repositories
RUN apt-get update && \
    apt-get install -y software-properties-common

# Add the deadsnakes PPA for Python 3.11
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update

# Install Python 3.11 and pip
# Install Python 3.11 and development packages
RUN apt-get install -y python3.11 python3.11-venv python3.11-dev

# Download and install the latest pip using get-pip.py
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3.11 get-pip.py && \
    rm get-pip.py

    
# Set the default Python version to 3.11
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

RUN ln -sf /usr/bin/python3.11 /usr/bin/python && \
    ln -sf /usr/bin/python3.11 /usr/bin/python3
    
RUN python --version
RUN python3 --version
RUN pip --version
RUN pip3 --version

WORKDIR /workspace
RUN git clone https://github.com/C0untFloyd/roop-unleashed
WORKDIR /workspace/roop-unleashed
RUN pip3 install -r requirements.txt

# Expose port 7860
EXPOSE 7860

# Set the entrypoint to run the application
CMD ["python", "run.py"]
