#!/bin/bash
set -e
set -x

pushd .
git clone --depth 3 https://github.com/quiet/libfec.git
cd libfec
./configure
make
sudo make install
popd

pushd .
git clone -b devel --single-branch --depth 3 https://github.com/quiet/liquid-dsp.git
cd liquid-dsp
./bootstrap.sh
./configure
make
sudo make install
popd

pushd .
wget -O jansson.zip https://github.com/akheron/jansson/archive/v2.12.zip
unzip -q -d . jansson.zip
cd jansson-2.12
autoreconf -i
./configure
make
sudo make install
popd

pushd .
git clone https://git.assembla.com/portaudio.git portaudio
cd portaudio
git checkout 396fe4b
./configure
make
sudo make install
popd

pushd .
wget -O libsndfile.tgz http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz
tar -xzvf libsndfile.tgz
cd libsndfile-1.0.28
./configure
make
sudo make install
popd

sudo ldconfig
