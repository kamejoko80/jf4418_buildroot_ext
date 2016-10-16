##Buildroot External Files For JF4418##
   
   Using u-boot branch 2015.11.x   
    
##Build Steps##

   $ mkdir jf4418_buildroot
   
   $ git clone https://github.com/pdtechvn/jf4418_buildroot_ext.git
   
   $ git clone git://git.buildroot.net/buildroot
   
   $ cd buildroot
   
   $ git checkout 2015.11.x
   
   $ make BR2_EXTERNAL=../jf4418_buildroot_ext jf4418_defconfig    
   
   $ make menuconfig
   
   $ make 

###Options###

   jf4418_gui_defconfig - For a Qt based application launcher and environment.

   jf4418_defconfig     - For JF4418 Basic configuration.

###Known Issues###

   JF4418 requires running _hciconfig hci0 up_ after boot, to bring bluetooth up.

###Precautions###

   Root is the only user on initial startup, and has no password. Root can log in through SSH like this. Be sure to give root a password!!!
   
###Copy Images into uSC card###

   $ cd output/deploy
   
   We need to build u-boot by using external toolschain :
   
   $ sudo ./build_uboot.sh
   
   Insert uSD card into PC, we'll have device name for example /dev/sdx (x should be b,c, or d...)
   
   $ sudo ./fushing.sh /dev/sdx
   
###Booting Linux###

   Insert uSD into uSD card socket of JF4418, after power on, the board run u-boot with console promt is s5p4418#, before booting Linux we set up u-boot environtment variables as bellow commands :
   
   s5p4418# setenv bootcmd 'fatload mmc 0:1 0x48000000 uImage; bootm 0x48000000'
   s5p4418# setenv bootargs 'console=ttyAMA0,115200n8 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait init=/sbin/init systemd.show_status=false g_ether.host_addr=82:cf:ce:fa:44:18 lcd=HDMI720P60'
   s5p4418# save

   Then we can reset the board by the following command :

   s5p4418# reset
   