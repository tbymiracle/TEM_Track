#!/bin/bash
# set up a virtual environment to avoid library conflict
apt-get install git make gcc gcc-c++ bzip2 zip unzip python-pip
#apt-get install gmp-devel mpfr-devel libmpc-devel maven kernel-devel
#python anaconda


wget -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
export PATH=$PATH:/root/miniconda3/bin
conda create -n python3 python=3.6
source activate python3
pip install numpy
pip install --upgrade pip

#下载cuda
wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
sudo sh cuda_10.2.89_440.33.01_linux.run
#torch
echo "installing pytorch 1.1. You may need to go to https://pytorch.org/ to find the best way to install on your machine (OS, CUDA etc.)"
pip install torch==1.1.0 -f https://download.pytorch.org/whl/cu100/stable
pip install torchvision==0.3.0
pip install --upgrade cython

git clone https://github.com/rsummers11/CADLab
cd CADLab/MULAN_universal_lesion_analysis
# necessary python libraries
pip install -r requirements.txt

sudo apt install python3-tk

python setup.py build develop

rm -rf build

pip install 'pillow<7.0.0'