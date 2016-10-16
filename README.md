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

###Boot log###

>s5p4418# reset
>resetting ...
>
> -----------------------------------------------------------------
>|     2nd Boot @ PDTECH Co, LTD : V1.0 - May 16 2016 17:37:56     |
> -----------------------------------------------------------------
> -----------------------------------------------------------------
>| PLL0          | 550000000  |            |           |           |
>| PLL1          | 1200000000 |            |           |           |
>| PLL2          | 800000000  |            |           |           |
>| PLL3          | 614394000  |            |           |           |
> -----------------------------------------------------------------
>| Divider0 PLL1 | CPU        | 1200000000 | CPU BUS   | 300000000 |
>| Divider1 PLL2 | BCLK       | 400000000  | PCLK      | 200000000 |
>| Divider2 PLL2 | MDCLK      | 800000000  | MCLK      | 800000000 |
>|               | MBCLK      | 400000000  | MPCLK     | 200000000 |
>| Divider3 PLL0 | G3D  BCLK  | 550000000  |           |           |
>| Divider4 PLL2 | MPEG BCLK  | 400000000  | MPEG PCLK | 200000000 |
> -----------------------------------------------------------------
>
>USBD VID = 2375, PID = 4330
>123
>DDR3 POR Init Start
>READDELAY   = 0x0C0C0C0C
>WRITEDELAY  = 0x02020202
>phy init
>
>########## READ/GATE Level ##########
>
>########## Gate Leveling - Start ##########
>
>########## Gate Leveling - End ##########
>
>GATE CYC  = 0x00210842
>GATE CODE = 0x00000000
>Read  DQ  = 0x0C0C0C0C
>Write DQ  = 0x02020202
>DDR3 Init Done!
>Loading from sdmmc...
>Config clock GEN
>Ver 2.0 or later SD Memory Card
>Config clock GEN
>NX_SDMMC_Open Successfully
>Load from :0x00000040 Sector
>Load Addr :0x40100000,  Load Size :0x00040000,  Launch Addr :0x40100000
>Config clock GEN
> Image Loading Done!
>Launch to 0x40100000
>
>
>U-Boot 2014.07 (Oct 17 2016 - 01:10:25)
>
>PLL : [0] =  550000000, [1] = 1200000000, [2] =  800000000, [3] =  614399000
>PLL1: CPU FCLK = 1200000000, HCLK = 300000000
>PLL2: BUS BCLK =  400000000, PCLK = 200000000
>PLL2: MEM MCLK =  800000000, DCLK = 800000000, BCLK = 400000000, PCLK = 200000000
>PLL0: G3D BCLK =  550000000
>PLL2: MPG BCLK =  400000000, PCLK = 200000000
>I2C:   ready
>DRAM:  256 MiB
>Heap = 0x43000000~0x45000000
>Code = 0x42c00000~0x42c7906c
>GLD  = 0x42bffeb8
>GLBD = 0x42bffe68
>SP   = 0x42bffe68,0x42bffe50(CURR)
>PC   = 0x42c060d4
>TAGS = 0x40000100
>PAGE = 0x42c80000~0x42c8c000
>MACH = [4330]
>VER  = 1
>BOARD= [jf4418]
>LCD  = N/A (-1)
>MMC:   NXP DWMMC: 0, NXP DWMMC: 1, NXP DWMMC: 2
>In:    serial
>Out:   serial
>Err:   serial
>switch to partitions #0, OK
>mmc0 is current device
>HDMI: display.0, preset 0 (1280 *  720)
>HDMI: PHY Ready!!!
>Failed to mount ext2 filesystem...
>** Unrecognized filesystem type **
>can't find bmp at 0x47000000 (type:0xffff), fb:0x46000000...
>LOGO: DRAW FB=0x46000000, X=1280, Y= 720, Bpp=32
>Net:   Board Net Initialization Failed
>No ethernet found.
>Hit any key to stop autoboot:  0
>## Booting kernel from Legacy Image at 48000000 ...
>   Image Name:   Linux-3.4.39-Jellyfish
>   Image Type:   ARM Linux Kernel Image (uncompressed)
>   Data Size:    4824896 Bytes = 4.6 MiB
>   Load Address: 40008000
>   Entry Point:  40008000
>   Verifying Checksum ... OK
>   Loading Kernel Image ... OK
>
>Starting kernel ...
>
>[    0.000000] Booting Linux on physical CPU 0
>[    0.000000] Initializing cgroup subsys cpu
>[    0.000000] Linux version 3.4.39-Jellyfish (root@dmphuong-VirtualBox) (gcc version 4.9.3 (Buildroot 2015.11.1) ) #1 SMP PREEMPT Mon Oct 17 00:40:14 ICT 2016
>[    0.000000] CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c5387d
>[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>[    0.000000] Machine: JF4418
>[    0.000000] Display: HDMI selected
>[    0.000000] nxp_reserve_mem: reserve CMA: size 201326592
>[    0.000000] NXP/CMA: Reserved 0x74000000/0x0c000000 for 'ion'
>[    0.000000] NXP/CMA: success register cma region for 'ion'
>[    0.000000] Memory policy: ECC disabled, Data cache writealloc
>[    0.000000] CPU : iomap[ 0]: p 0xc0000000 -> v 0xf0000000 len=0x300000
>[    0.000000] CPU : iomap[ 1]: p 0xf0000000 -> v 0xf0300000 len=0x100000
>[    0.000000] CPU : iomap[ 2]: p 0xcf000000 -> v 0xf0400000 len=0x100000
>[    0.000000] CPU : iomap[ 3]: p 0x2c000000 -> v 0xf0500000 len=0x100000
>[    0.000000] CPU : iomap[ 4]: p 0x00000000 -> v 0xf0600000 len=0x100000
>[    0.000000] CPU : DMA Zone Size =16M, CORE 4
>[    0.000000] CPU : VERSION = 2 (0xE153000A), Assign Peripheral Exclusive Bus
>[    0.000000] s5p4418-jf4418: Board initialized
>[    0.000000] CPU : Clock Generator= 64 EA, DVFS = support, PLL.1
>[    0.000000] PLL : [0] =  550000000, [1] = 1200000000, [2] =  800000000, [3] =  614399000
>[    0.000000] PLL1: CPU FCLK = 1200000000, HCLK = 300000000
>[    0.000000] PLL2: BUS BCLK =  400000000, PCLK = 200000000
>[    0.000000] PLL2: MEM MCLK =  800000000, DCLK = 800000000, BCLK = 400000000, PCLK = 200000000
>[    0.000000] PLL0: G3D BCLK =  550000000
>[    0.000000] PLL2: MPG BCLK =  400000000, PCLK = 200000000
>[    0.000000] PERCPU: Embedded 8 pages/cpu @8135a000 s12288 r8192 d12288 u32768
>[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 259840
>[    0.000000] Kernel command line: console=ttyAMA0,115200n8 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait init=/sbin/init systemd.show_status=false g_ether.host_addr=82:cf:ce:fa:44:18 lcd=HDMI720P60
>[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
>[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
>[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
>[    0.000000] allocated 2097152 bytes of page_cgroup
>[    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
>[    0.000000] Memory: 1024MB = 1024MB total
>[    0.000000] Memory: 829164k/829164k available, 219412k reserved, 0K highmem
>[    0.000000] Virtual kernel memory layout:
>[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
>[    0.000000]     vmalloc : 0xc0800000 - 0xfee00000   ( 998 MB)
>[    0.000000]     lowmem  : 0x80000000 - 0xc0000000   (1024 MB)
>[    0.000000]     pkmap   : 0x7fe00000 - 0x80000000   (   2 MB)
>[    0.000000]     modules : 0x7f000000 - 0x7fe00000   (  14 MB)
>[    0.000000]       .text : 0x80008000 - 0x808be7a0   (8922 kB)
>[    0.000000]       .init : 0x808bf000 - 0x808f8000   ( 228 kB)
>[    0.000000]       .data : 0x808f8000 - 0x809753f0   ( 501 kB)
>[    0.000000]        .bss : 0x80975414 - 0x80a52e40   ( 887 kB)
>[    0.000000] SLUB: Genslabs=11, HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
>[    0.000000] Preemptible hierarchical RCU implementation.
>[    0.000000] NR_IRQS:288
>[    0.000000] VIC @f0002000: id 0x00041192, vendor 0x41
>[    0.000000] VIC @f0003000: id 0x00041192, vendor 0x41
>[    0.000000] GPIO  @f001a000: start  64, mask 0xffffffff (gpio 53)
>[    0.000000] GPIO  @f001b000: start  96, mask 0xffffffff (gpio 54)
>[    0.000000] GPIO  @f001c000: start 128, mask 0xffffffff (gpio 55)
>[    0.000000] GPIO  @f001d000: start 160, mask 0xffffffff (gpio 56)
>[    0.000000] GPIO  @f001e000: start 192, mask 0xffffffff (gpio 57)
>[    0.000000] ALIVE @f0010800: start 224, mask 0x000000ff (alive 4)
>[    0.000000] GIC   @f0301000: start 256 (vic 31)
>[    0.000000] timer.0: source,  10000000(HZ:250), mult:3355443200
>[    0.000000] timer.1: event ,  10000000(HZ:250), mult:42949673
>[    0.000000] sched_clock: 32 bits at 250 Hz, resolution 4000000ns, wraps every 4294967292ms
>[    0.000000] Console: colour dummy device 80x30
>[    0.000000] Calibrating delay loop... 2390.01 BogoMIPS (lpj=4780032)
>[    0.036000] pid_max: default: 32768 minimum: 301
>[    0.036000] Security Framework initialized
>[    0.036000] SELinux:  Initializing.
>[    0.036000] Mount-cache hash table entries: 512
>[    0.036000] Initializing cgroup subsys debug
>[    0.036000] Initializing cgroup subsys cpuacct
>[    0.036000] Initializing cgroup subsys memory
>[    0.036000] Initializing cgroup subsys freezer
>[    0.036000] CPU: Testing write buffer coherency: ok
>[    0.036000] CPU0: thread -1, cpu 0, socket 10, mpidr 80000a00
>[    0.036000] hw perfevents: enabled with ARMv7 Cortex-A9 PMU driver, 7 counters available
>[    0.036000] Setting up static identity map for 0x40668b68 - 0x40668bc0
>[    0.036000] L310 cache controller enabled
>[    0.036000] l2x0: 16 ways, CACHE_ID 0x4100c4c8, AUX_CTRL 0x70470001, Cache size: 1048576 B
>[    0.076000] CPU1: thread -1, cpu 1, socket 10, mpidr 80000a01
>[    0.108000] CPU2: thread -1, cpu 2, socket 10, mpidr 80000a02
>[    0.140000] CPU3: thread -1, cpu 3, socket 10, mpidr 80000a03
>[    0.140000] Brought up 4 CPUs
>[    0.140000] SMP: Total of 4 processors activated (9560.06 BogoMIPS).
>[    0.140000] devtmpfs: initialized
>[    0.144000] VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 4
>[    0.144000] pwm: max = 50000000 hz
>[    0.144000] prepare_gpio_suspend:
>[    0.144000]   alfn[0][0]: 0x00000000, alfn[0][1]: 0x00000000
>[    0.144000]   alfn[1][0]: 0x66800000, alfn[1][1]: 0x55555566
>[    0.144000]   alfn[2][0]: 0x55555555, alfn[2][1]: 0x00555555
>[    0.144000]   alfn[3][0]: 0x00000000, alfn[3][1]: 0x00000000
>[    0.144000]   alfn[4][0]: 0x00000000, alfn[4][1]: 0x55540000
>[    0.144000] dummy:
>[    0.144000] NET: Registered protocol family 16
>[    0.144000] [Register machine platform devices]
>[    0.144000] mach: add amba device uart-pl011.0
>[    0.144000] mach: add amba device uart-pl011.1
>[    0.144000] mach: add amba device uart-pl011.3
>[    0.144000] mach: add amba device uart-pl011.4
>[    0.144000] mach: add amba device pl08xdmac.0
>[    0.144000] mach: add amba device pl08xdmac.1
>[    0.144000] mach: add amba device ssp-pl022.0
>[    0.148000] mach: add device syncgen [2]
>[    0.148000] mach: add device hdmi
>[    0.148000] mach: add device i2c bus (array:3)
>[    0.148000] mach: add device Real Time Clock
>[    0.148000] mach: add device generic pwm (array:4)
>[    0.148000] mach: add device generic gpio (array:6)
>[    0.148000] mach: add device i2s (array:1)
>[    0.148000] mach: add device spdif tx
>[    0.148000] mach: add device usb_ehci
>[    0.148000] mach: add device usb_ohci
>[    0.148000] mach: add device usb otg
>[    0.148000] mach: add device ion-nxp
>[    0.148000] mach: add device adc
>[    0.148000] mach: add graphic device opengl|es
>[    0.148000] [Register board platform devices]
>[    0.148000] plat: board revision 4
>[    0.148000] plat: add dynamic frequency (pll.1)
>[    0.148000] plat: add framebuffer
>[    0.148000] plat: boot from mmc.0
>[    0.148000] plat: add device sdmmc [0]
>[    0.152000] plat: add device sdmmc [1]
>[    0.152000] plat: add device sdmmc [2]
>[    0.152000] plat: add backlight pwm device
>[    0.152000] plat: add device keypad
>[    0.152000] plat: add device fixed voltage
>[    0.152000] plat: add device spdif playback
>[    0.152000] plat: add device asoc-alc5623
>[    0.152000] plat: add device nxp-v4l2
>[    0.152000] camera_power_control: failed to regulator_get() for vcam1_1.8Vplat: register spidev
>[    0.160000] plat: add touch(ft5x0x) device
>[    0.160000] plat: add adxl34x device
>[    0.160000] plat: add bmp085 device
>[    0.160000] plat: add ds1307 device
>[    0.160000] plat: add pcf8591 device
>[    0.160000] plat: add device nxp-gmac
>[    0.160000] plat: add device gpio_led
>[    0.160000]
>[    0.160000] hw-breakpoint: Debug register access (0xee113e95) caused undefined instruction on CPU 1
>[    0.160000] hw-breakpoint: Debug register access (0xee113e95) caused undefined instruction on CPU 3
>[    0.160000] hw-breakpoint: Debug register access (0xee113e95) caused undefined instruction on CPU 2
>[    0.160000] hw-breakpoint: CPU 3 debug is powered down!
>[    0.160000] hw-breakpoint: CPU 2 debug is powered down!
>[    0.160000] hw-breakpoint: CPU 1 debug is powered down!
>[    0.160000] hw-breakpoint: Debug register access (0xee113e95) caused undefined instruction on CPU 0
>[    0.160000] hw-breakpoint: CPU 0 debug is powered down!
>[    0.160000] Serial: AMBA PL011 UART driver
>[    0.160000] uart-pl011.0: ttyAMA0 at MMIO 0xc00a1000 (irq = 7) is a PL011 rev3
>[    0.164000] console [ttyAMA0] enabled
>[    0.168000] uart-pl011.1: ttyAMA1 at MMIO 0xc00a0000 (irq = 6) is a PL011 rev3
>[    0.176000] uart-pl011.3: ttyAMA2 at MMIO 0xc00a3000 (irq = 9) is a PL011 rev3
>[    0.180000] uart-pl011.4: ttyAMA3 at MMIO 0xc006d000 (irq = 10) is a PL011 rev3
>[    0.200000] bio: create slab <bio-0> at 0
>[    0.204000] gpiochip_add: registered GPIOs 0 to 31 on device: nxp-gpio.0
>[    0.208000] gpiochip_add: registered GPIOs 32 to 63 on device: nxp-gpio.1
>[    0.212000] gpiochip_add: registered GPIOs 64 to 95 on device: nxp-gpio.2
>[    0.216000] gpiochip_add: registered GPIOs 96 to 127 on device: nxp-gpio.3
>[    0.220000] gpiochip_add: registered GPIOs 128 to 159 on device: nxp-gpio.4
>[    0.224000] gpiochip_add: registered GPIOs 160 to 167 on device: nxp-gpio.5
>[    0.228000] pl08xdmac pl08xdmac.0: Unbalanced pm_runtime_enable!
>[    0.232000] pl08xdmac pl08xdmac.0: initialized 8 virtual memcpy channels
>[    0.236000] pl08xdmac pl08xdmac.0: initialized 16 virtual slave channels
>[    0.240000] pl08xdmac pl08xdmac.0: DMA: PL080 rev1 at 0xc0000000 irq 1
>[    0.244000] pl08xdmac pl08xdmac.1: Unbalanced pm_runtime_enable!
>[    0.248000] pl08xdmac pl08xdmac.1: initialized 8 virtual memcpy channels
>[    0.252000] pl08xdmac pl08xdmac.1: initialized 15 virtual slave channels
>[    0.256000] pl08xdmac pl08xdmac.1: DMA: PL080 rev1 at 0xc0001000 irq 2
>[    0.264000] fixed_vdds: 1350 mV
>[    0.264000] nxp_ion_probe success!!!
>[    0.268000] SCSI subsystem initialized
>[    0.272000] ssp-pl022 ssp-pl022.0: ARM PL022 driver, device ID: 0x00041022
>[    0.276000] pl022: mapped registers from 0xc005b000 to f005b000
>[    0.280000] ssp-pl022 ssp-pl022.0: setup for DMA on RX dma1chan7, TX dma1chan6
>[    0.284000] ssp-pl022 ssp-pl022.0: will use autosuspend for runtime pm, delay 10ms
>[    0.288000] usbcore: registered new interface driver usbfs
>[    0.292000] usbcore: registered new interface driver hub
>[    0.296000] usbcore: registered new device driver usb
>[    0.304000] nxp-i2c.0:   390625 hz [pclk=200000000, clk = 256, scale= 1, timeout= 500 ms]
>[    0.308000] nxp-i2c.1:    97656 hz [pclk=200000000, clk = 256, scale= 7, timeout= 500 ms]
>[    0.312000] nxp-i2c.2:   195312 hz [pclk=200000000, clk = 256, scale= 3, timeout= 500 ms]
>[    0.316000] Linux media interface: v0.10
>[    0.320000] Linux video capture interface: v2.00
>[    0.324000] pps_core: LinuxPPS API ver. 1 registered
>[    0.328000] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
>[    0.332000] PTP clock support registered
>[    0.336000] Advanced Linux Sound Architecture Driver Version 1.0.25.
>[    0.340000] Bluetooth: Core ver 2.16
>[    0.344000] NET: Registered protocol family 31
>[    0.348000] Bluetooth: HCI device and connection manager initialized
>[    0.352000] Bluetooth: HCI socket layer initialized
>[    0.356000] Bluetooth: L2CAP socket layer initialized
>[    0.360000] Bluetooth: SCO socket layer initialized
>[    0.364000] cfg80211: Calling CRDA to update world regulatory domain
>[    0.364000] Switching to clocksource source timer
>[    0.384000] NET: Registered protocol family 2
>[    0.388000] IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
>[    0.396000] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
>[    0.404000] TCP bind hash table entries: 65536 (order: 7, 786432 bytes)
>[    0.412000] TCP: Hash tables configured (established 131072 bind 65536)
>[    0.420000] TCP: reno registered
>[    0.424000] UDP hash table entries: 512 (order: 2, 16384 bytes)
>[    0.428000] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
>[    0.436000] NET: Registered protocol family 1
>[    0.440000] RPC: Registered named UNIX socket transport module.
>[    0.448000] RPC: Registered udp transport module.
>[    0.452000] RPC: Registered tcp transport module.
>[    0.456000] RPC: Registered tcp NFSv4.1 backchannel transport module.
>[    0.464000] Disply Reset Status : On
>[    0.468000] Display HDMI register operation
>[    0.472000] Display.0 fps=161 (6 ms), wait= 4 jiffies, Pixelclk=200000000hz
>[    0.480000] bt_bcm: rfkill initialized
>[    0.484000] audit: initializing netlink socket (disabled)
>[    0.488000] type=2000 audit(0.488:1): initialized
>[    0.500000] NFS: Registering the id_resolver key type
>[    0.504000] fuse init (API version 7.18)
>[    0.508000] msgmni has been set to 1619
>[    0.512000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
>[    0.520000] io scheduler noop registered
>[    0.524000] io scheduler deadline registered
>[    0.528000] io scheduler cfq registered (default)
>[    0.532000] display.0 connected to fb.0  ...
>[    0.536000] nxp-fb.0: dma addr = 0x74000000, buf[0xb3add740]
>[    0.544000] nxp-fb.0: dma addr = 0x74384000, buf[0xb3add900]
>[    0.604000] hdmi_stop entered
>[    0.608000] nxp-fb 0: out[0], 1280 * 720 - 32 bpp (phys:74000000 virt:0xb4000000 max:7372800)
>[    0.624000] uart-pl011 uart-pl011.0: no DMA platform data
>[    0.628000] uart-pl011 uart-pl011.1: no DMA platform data
>[    0.632000] uart-pl011 uart-pl011.3: no DMA platform data
>[    0.640000] uart-pl011 uart-pl011.4: no DMA platform data
>[    0.648000] loop: module loaded
>[    0.648000] tun: Universal TUN/TAP device driver, 1.6
>[    0.656000] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
>[    0.660000]  -- nxpmac initialize --
>[    0.664000] stmmac - user ID: 0x37, Synopsys ID: 0x37
>[    0.668000]  Ring mode enabled
>[    0.672000]  DMA HW capability register supported
>[    0.676000]  Enhanced/Alternate descriptors
>[    0.680000]  Enabled extended descriptors
>[    0.684000]  RX Checksum Offload Engine supported (type 2)
>[    0.692000]  TX Checksum insertion supported
>[    0.696000]  Wake-Up On Lan supported
>[    0.700000]  Enable RX Mitigation via HW Watchdog Timer
>[    0.740000] stmmac: probed
>[    0.744000] eth0: PHY ID 001cc915 at 0 IRQ 215 (stmmac-0:00)
>[    0.748000] eth0: PHY ID 001cc915 at 7 IRQ 215 (stmmac-0:07) active
>[    0.756000] PPP generic driver version 2.4.2
>[    0.760000] PPP BSD Compression module registered
>[    0.764000] PPP Deflate Compression module registered
>[    0.768000] PPP MPPE Compression module registered
>[    0.776000] NET: Registered protocol family 24
>[    0.780000] usbcore: registered new interface driver asix
>[    0.784000] usbcore: registered new interface driver cdc_ether
>[    0.792000] usbcore: registered new interface driver net1080
>[    0.796000] usbcore: registered new interface driver cdc_subset
>[    0.804000] usbcore: registered new interface driver zaurus
>[    0.808000] usbcore: registered new interface driver cdc_ncm
>[    0.812000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
>[    0.820000] nxp-ehci nxp-ehci: SLsi Synopsys EHCI Host Controller
>[    0.828000] nxp-ehci nxp-ehci: new USB bus registered, assigned bus number 1
>[    0.832000] nxp-ehci nxp-ehci: irq 50, io mem 0xc0030000
>[    0.852000] nxp-ehci nxp-ehci: USB 0.0 started, EHCI 1.00
>[    0.856000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
>[    0.864000] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>[    0.868000] usb usb1: Product: SLsi Synopsys EHCI Host Controller
>[    0.876000] usb usb1: Manufacturer: Linux 3.4.39-Jellyfish ehci_hcd
>[    0.880000] usb usb1: SerialNumber: nxp-ehci
>[    0.888000] hub 1-0:1.0: USB hub found
>[    0.892000] hub 1-0:1.0: 3 ports detected
>[    0.896000] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
>[    1.100000] Core Release: 2.93a
>[    1.104000] Setting default values for core params
>[    1.108000] Finished setting default values for core params
>[    1.208000] usb 1-1: new high-speed USB device number 2 using nxp-ehci
>[    1.312000] Using Descriptor DMA mode
>[    1.316000] Dedicated Tx FIFOs mode
>[    1.320000] dwc_otg dwc_otg: DWC OTG Controller
>[    1.324000] dwc_otg dwc_otg: new USB bus registered, assigned bus number 2
>[    1.332000] dwc_otg dwc_otg: irq 49, io mem 0x00000000
>[    1.336000] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
>[    1.344000] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>[    1.348000] usb 1-1: New USB device found, idVendor=0424, idProduct=2514
>[    1.348000] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>[    1.348000] hub 1-1:1.0: USB hub found
>[    1.348000] hub 1-1:1.0: 4 ports detected
>[    1.372000] usb usb2: Product: DWC OTG Controller
>[    1.376000] usb usb2: Manufacturer: Linux 3.4.39-Jellyfish dwc_otg_hcd
>[    1.384000] usb usb2: SerialNumber: dwc_otg
>[    1.388000] hub 2-0:1.0: USB hub found
>[    1.392000] hub 2-0:1.0: 1 port detected
>[    1.396000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>[    1.404000] nxp-ohci nxp-ohci: SLsi Synopsys OHCI Host Controller
>[    1.408000] nxp-ohci nxp-ohci: new USB bus registered, assigned bus number 3
>[    1.416000] nxp-ohci nxp-ohci: irq 50, io mem 0xc0020000
>[    1.468000] HDMI HPD State 0x0
>[    1.480000] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
>[    1.484000] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>[    1.492000] usb usb3: Product: SLsi Synopsys OHCI Host Controller
>[    1.500000] usb usb3: Manufacturer: Linux 3.4.39-Jellyfish ohci_hcd
>[    1.504000] usb usb3: SerialNumber: nxp-ohci
>[    1.508000] hub 3-0:1.0: USB hub found
>[    1.512000] hub 3-0:1.0: 3 ports detected
>[    1.516000] Initializing USB Mass Storage driver...
>[    1.520000] usbcore: registered new interface driver usb-storage
>[    1.528000] USB Mass Storage support registered.
>[    1.532000] g_ether gadget: using random self ethernet address
>[    1.540000] usb0: MAC 46:3d:22:61:ef:37
>[    1.544000] usb0: HOST MAC 82:cf:ce:fa:44:18
>[    1.548000] g_ether gadget: Ethernet Gadget, version: Memorial Day 2008
>[    1.552000] g_ether gadget: g_ether ready
>[    1.556000] mousedev: PS/2 mouse device common for all mice
>[    1.564000] input: Nexell Keypad as /devices/platform/nxp-keypad/input/input0
>[    1.572000] usbcore: registered new interface driver xpad
>[    1.576000] input: ft5x0x_ts as /devices/virtual/input/input1
>[    1.592000] read reg (0xa6) error, -11
>[    1.596000] ft5x0x_ts 2-0038: chip not found
>[    1.656000] ft5x0x_ts 2-0038: probe ft5x0x TouchScreen failed, -11
>[    1.660000] ft5x0x_ts: probe of 2-0038 failed with error -11
>[    1.668000] [RTC] day=2016.01.01 time=10:27:35
>[    1.672000] nxp-rtc nxp-rtc.0: rtc core: registered nxp-rtc as rtc0
>[    1.676000] i2c /dev entries driver
>[    1.680000] lirc_dev: IR Remote Control driver registered, major 248
>[    1.688000] IR NEC protocol handler initialized
>[    1.692000] IR RC5(x) protocol handler initialized
>[    1.696000] IR RC6 protocol handler initialized
>[    1.700000] IR JVC protocol handler initialized
>[    1.704000] IR Sony protocol handler initialized
>[    1.712000] IR RC5 (streamzap) protocol handler initialized
>[    1.716000] IR SANYO protocol handler initialized
>[    1.720000] IR LIRC bridge handler initialized
>[    1.724000] gspca_main: v2.14.0 registered
>[    1.732000] usbcore: registered new interface driver uvcvideo
>[    1.736000] USB Video Class driver (1.1.1)
>[    1.740000] Driver for 1-wire Dallas network protocol.
>[    1.748000] device-mapper: uevent: version 1.0.3
>[    1.752000] device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised: dm-devel@redhat.com
>[    1.760000] Bluetooth: HCI UART driver ver 2.2
>[    1.764000] Bluetooth: HCI H4 protocol initialized
>[    1.768000] DVFS: ASV[0] IDS(10mA,  6) Ro(110, 71)
>[    1.776000] ASV  0 =  1400000khz,  1280000 uV
>[    1.780000] ASV  1 =  1200000khz,  1200000 uV
>[    1.784000] ASV  2 =  1000000khz,  1140000 uV
>[    1.788000] ASV  3 =   800000khz,  1100000 uV
>[    1.792000] ASV  4 =   700000khz,  1080000 uV
>[    1.796000] ASV  5 =   600000khz,  1040000 uV
>[    1.800000] ASV  6 =   500000khz,  1040000 uV
>[    1.804000] ASV  7 =   400000khz,  1040000 uV
>[    1.808000] DVFS: regulator vdd_arm_1.3V
>[    1.812000] DVFS: cpu DVFS with PLL.1 [tables=8]
>[    1.820000] cpuidle: using governor ladder
>[    1.824000] cpuidle: using governor menu
>[    1.828000] Synopsys Designware Multimedia Card Interface Driver
>[    1.832000] dw_mmc dw_mmc.0: Using internal DMA controller.
>[    1.840000] mmc0: no vmmc regulator found
>[    1.844000] dw_mmc dw_mmc.0: Using external card detect irq 225 (io 161)
>[    1.852000] dw_mmc dw_mmc.0: Version ID is 250a
>[    1.856000] dw_mmc dw_mmc.0: DW MMC controller at irq 43, 32 bit host data width, 32 deep fifo hw timeout 500 ms
>[    1.868000] mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz, actual 396825HZ div = 63)
>[    1.876000] dw_mmc dw_mmc.1: Using PIO mode.
>[    1.880000] mmc1: no vmmc regulator found
>[    1.884000] dw_mmc dw_mmc.1: Version ID is 250a
>[    1.888000] dw_mmc dw_mmc.1: DW MMC controller at irq 44, 32 bit host data width, 32 deep fifo hw timeout 500 ms
>[    1.900000] dw_mmc dw_mmc.2: Using internal DMA controller.
>[    1.904000] mmc2: no vmmc regulator found
>[    1.908000] dw_mmc dw_mmc.2: Using external card detect irq 152 (io 88)
>[    1.916000] dw_mmc dw_mmc.2: Version ID is 250a
>[    1.920000] dw_mmc dw_mmc.2: DW MMC controller at irq 45, 32 bit host data width, 32 deep fifo hw timeout 500 ms
>[    1.932000] usbcore: registered new interface driver usbhid
>[    1.940000] usbhid: USB HID core driver
>[    1.944000] ADC: CHs 8, 200000(1000000 ~ 130208) sample rate, polling mode, scale=166(bit 6)
>[    1.952000] snd pcm: register sound platform 'nxp-pcm'
>[    1.960000] snd i2s: ch 0, master, iis mode, 48000(47999)hz, 32 FBITs, MCLK=12287980hz, RFS=256
>[    1.984000] alc5623_jack_status_check: hp jack OUT
>[    1.988000] Done: alc5623_dai_init register audio jack detect, 158
>[    1.996000] asoc: alc5621-hifi <-> nxp-i2s.0 mapping ok
>[    2.000000] input: I2S-alc5623 Headphone Jack as /devices/platform/alc5623-audio.0/sound/card0/input2
>[    2.012000] alc5623-dai: register card alc5621-hifi -> nxp-i2s.0
>[    2.016000] spdif-tx: 48000(47348)Hz, MCLK=12121212hz HDMI out
>[    2.024000] asoc: dit-hifi <-> nxp-spdif-tx mapping ok
>[    2.028000] GACT probability NOT on
>[    2.032000] mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
>[    2.032000] mmc0: new high speed SDHC card at address 8570
>[    2.032000] mmcblk0: mmc0:8570 SD04G 3.69 GiB
>[    2.032000]  mmcblk0: p1 p2
>[    2.048000] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz, actual 396825HZ div = 63)
>[    2.064000] Mirror/redirect action on
>[    2.068000] u32 classifier
>[    2.072000]     Actions configured
>[    2.076000] Netfilter messages via NETLINK v0.30.
>[    2.080000] nf_conntrack version 0.5.0 (12955 buckets, 51820 max)
>[    2.084000] ctnetlink v0.93: registering with nfnetlink.
>[    2.092000] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 300000Hz, actual 297619HZ div = 84)
>[    2.100000] NF_TPROXY: Transparent proxy support initialized, version 4.1.0
>[    2.108000] NF_TPROXY: Copyright (c) 2006-2007 BalaBit IT Ltd.
>[    2.112000] xt_time: kernel timezone is -0000
>[    2.116000] ip_tables: (C) 2000-2006 Netfilter Core Team
>[    2.124000] arp_tables: (C) 2002 David S. Miller
>[    2.128000] TCP: cubic registered
>[    2.132000] Initializing XFRM netlink socket
>[    2.136000] NET: Registered protocol family 10
>[    2.140000] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 200000Hz, actual 200000HZ div = 125)
>[    2.152000] Mobile IPv6
>[    2.152000] ip6_tables: (C) 2000-2006 Netfilter Core Team
>[    2.160000] IPv6 over IPv4 tunneling driver
>[    2.164000] NET: Registered protocol family 17
>[    2.168000] NET: Registered protocol family 15
>[    2.172000] Bluetooth: RFCOMM TTY layer initialized
>[    2.176000] Bluetooth: RFCOMM socket layer initialized
>[    2.184000] Bluetooth: RFCOMM ver 1.11
>[    2.188000] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
>[    2.192000] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 100000Hz, actual 100000HZ div = 250)
>[    2.200000] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
>[    2.208000] NET: Registered protocol family 35
>[    2.212000] Registering the dns_resolver key type
>[    2.216000] Registering SWP/SWPB emulation handler
>[    2.552000] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz, actual 396825HZ div = 63)
>[    2.596000] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
>[    2.604000] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
>[    2.612000] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
>[    2.620000] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
>[    2.720000] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
>[    2.732000] mmc1: new high speed SDIO card at address 0001
>[    2.768000] wl_create_event_handler(): thread:wl_event_handler:57 started
>[    2.776000] dhd_attach(): thread:dhd_watchdog_thread:58 started
>[    2.780000] dhd_attach(): thread:dhd_dpc:59 started
>[    2.784000] dhd_attach(): thread:dhd_rxf:5a started
>[    2.928000] otg_wakelock_init: No USB transceiver found
>[    2.932000] nxp-rtc nxp-rtc.0: setting system clock to 2016-01-01 10:27:36 UTC (1451644056)
>[    2.940000] ALSA device list:
>[    2.944000]   #0: I2S-alc5623
>[    2.944000]   #1: SPDIF-Transciever
>[    3.208000] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
>[    3.216000] VFS: Mounted root (ext4 filesystem) on device 179:2.
>[    3.228000] devtmpfs: mounted
>[    3.228000] Freeing init memory: 228K
>[    3.232000] Write protecting the kernel text section 80008000 - 8088e000
>[    3.240000] rodata_test: attempting to write to read-only section:
>[    3.248000] write to read-only section trapped, success
>[    3.916000] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered
>Starting logging: OK
>Starting mdev...
>Initializing random number generator... done.
>Starting system message bus: done
>Starting network...
>/bin/sh: /usr/sbin/avahi-autoipd: not found
>Successfully initialized wpa_supplicant
>[    4.784000] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 98040Hz, actual 98039HZ div = 255)
>[    4.828000] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
>[    4.840000] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
>[    4.852000] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
>[    4.868000] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
>[    5.208000] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
>[    5.228000] dhd_conf_read_config: Ignore config file /lib/firmware/ap6212/config.txt
>Could not set interface wlan0 flags (UP): Operation not permitted
>WEXT: Could not set interface 'wlan0' UP
>wlan0: Failed to initialize driver interface
>Starting sshd: OK
>Starting bluetooth...
>[    5.660000] bt_bcm: rfkill set_block Off GPIOB.8
>[    5.740000] bt_bcm: rfkill set_block On  GPIOB.8
>
>Welcome to Buildroot
>buildroot login: root
>#

   

      
   
   
   
   