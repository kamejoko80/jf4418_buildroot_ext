#!/bin/bash

git clone https://github.com/pdtechvn/uboot-mkimage.git
cd uboot-mkimage
make
export PATH=$PATH:$PWD
cd ../

echo [Build Rootfs...]
mkdir work_dir
cd work_dir
git clone git://git.buildroot.net/buildroot
cd buildroot
git checkout 2015.11.x
make BR2_EXTERNAL=../../ jf4418_defconfig
make -j8



