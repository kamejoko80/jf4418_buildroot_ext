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
