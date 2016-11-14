#!/bin/bash

# ---- stuff to limit build log ---
set -e
export PING_SLEEP=30s
export WORKDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export BUILD_OUTPUT=$WORKDIR/build.out

touch $BUILD_OUTPUT

dump_output() {
   echo Tailing the last 500 lines of output:
   tail -500 $BUILD_OUTPUT  
}

error_handler() {
  echo ERROR: An error was encountered with the build.
  dump_output
  exit 1
}

# If an error occurs, run our error handler to output a tail of the build
trap 'error_handler' ERR

bash -c "while true; do echo \$(date) - building ...; sleep $PING_SLEEP; done" &
PING_LOOP_PID=$!

# My build is using maven, but you could build anything with this, E.g.
# your_build_command_1 >> $BUILD_OUTPUT 2>&1
# your_build_command_2 >> $BUILD_OUTPUT 2>&1

# ---- stuff to limit build log ---


git clone https://github.com/pdtechvn/uboot-mkimage.git
cd uboot-mkimage
make
export PATH=$PATH:$PWD
cd ../

apt-get install bc

echo [Build Rootfs...]
mkdir work_dir
cd work_dir
git clone git://git.buildroot.net/buildroot
cd buildroot
git checkout 2015.11.x
make BR2_EXTERNAL=../../ jf4418_defconfig

make -j8 >> $BUILD_OUTPUT 2>&1

# ---- stuff to limit build log ---
# The build finished without returning an error so dump a tail of the output
dump_output

# nicely terminate the ping output loop
kill $PING_LOOP_PID
# ---- stuff to limit build log ---
