# PyTorch CIFAR #

## Dependency ##

1. python 3.8.10
2. pip3 (latest stable) 
3. pytorch 1.10.1
4. nvidia-docker 2

### Nvidia Docker 2 ###

To avoid unmet dependencies issues when installing `nvidia-docker2`, we need to create preference for nvidia-docker.

```
vim /etc/apt/preferences.d/nvidia-docker-pin-1002

# with content:
Package: *
Pin: origin nvidia.github.io
Pin-Priority: 1002
```

Then, you can following the [instruction](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

```
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
    && curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu20.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo apt-get install -y nvidia-docker2
```

Restart the Docker daemon to complete the installation after setting the default runtime:

```
sudo systemctl restart docker
```

## Run ##

docker run -it -v /home/ruiliu/Develop/pytorch_cifar:/home/pytorch_cifar --runtime=nvidia --rm csruiliu/pytorch-cifar

