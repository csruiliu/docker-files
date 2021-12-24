FROM nvidia/cuda:11.3.1-cudnn8-runtime-ubuntu20.04

RUN apt update

# install python3.8 and pip3
RUN apt install -y python3 python3-pip

# install PyTorch
RUN pip3 install torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

# install torchinfo
RUN pip3 install torchinfo

