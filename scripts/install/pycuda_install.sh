#!/usr/bin/env bash
# "pycuda_install.sh": Download and build pycuda from source

sudo apt install ctags
sudo apt install libboost-all-dev
sudo apt install libatlas-base-dev gfortran
sudo apt install build-essential python3-dev python3-setuptools libboost-python3-dev libboost-thread-dev -y

TMP=$HOME/temp_dir
mkdir $TMP
cd $TMP

if [ ! -f $TMP/pycuda-VERSION.tar.gz ] ; then
    wget -O "pycuda-VERSION.tar.gz" https://files.pythonhosted.org/packages/5e/3f/5658c38579b41866ba21ee1b5020b8225cec86fe717e4b1c5c972de0a33c/pycuda-2019.1.2.tar.gz
fi
if [ ! -d $TMP/pycuda-VERSION ] ; then
    cd $TMP
    tar xpvf pycuda-VERSION.tar.gz
fi

cd $TMP/pycuda-VERSION
python3 configure.py --cuda-root=/usr/local/cuda --cudadrv-lib-dir=/usr/lib --boost-inc-dir=/usr/include --boost-lib-dir=/usr/lib --boost-python-libname=boost_python-py36 --boost-thread-libname=boost_thread
make -j ${nproc}
sudo -H python3 setup.py install
sudo -H python3 -m pip install .
