FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

RUN apt update

# install python3.7
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt install -y python3.7
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
RUN update-alternatives --set python3 /usr/bin/python3.7

# install and ungrade pip3
RUN apt install -y python3-pip
RUN pip3 install --upgrade pip

# install tensorflow 1.14
RUN pip3 install tensorflow-gpu==1.14
