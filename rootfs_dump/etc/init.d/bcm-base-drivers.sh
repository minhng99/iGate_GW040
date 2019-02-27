#!/bin/sh

trap "" 2


case "$1" in
	start)
		echo "Loading drivers and kernel modules... "
		echo

# RDPA
insmod /lib/modules/3.4.11-rt19/extra/bdmf.ko bdmf_chrdev_major=215
insmod /lib/modules/3.4.11-rt19/extra/rdpa_gpl.ko 
insmod /lib/modules/3.4.11-rt19/extra/rdpa_gpl_ext.ko 
insmod /lib/modules/3.4.11-rt19/extra/rdpa.ko 
 
insmod /lib/modules/3.4.11-rt19/extra/rdpa_mw.ko 
insmod /lib/modules/3.4.11-rt19/extra/bcmbrfp.ko 
# General
insmod /lib/modules/3.4.11-rt19/extra/chipinfo.ko 
insmod /lib/modules/3.4.11-rt19/extra/pktflow.ko 
# enet depends on moca depends on i2c
insmod /lib/modules/3.4.11-rt19/extra/i2c_bcm6xxx.ko 
insmod /lib/modules/3.4.11-rt19/extra/bcm3450.ko 
insmod /lib/modules/3.4.11-rt19/extra/gpon_i2c.ko && echo gpon_i2c 0x50 > /sys/bus/i2c/devices/i2c-0/new_device && echo gpon_i2c 0x51 > /sys/bus/i2c/devices/i2c-0/new_device && echo gpon_i2c 0x52 > /sys/bus/i2c/devices/i2c-0/new_device
 
insmod /lib/modules/3.4.11-rt19/extra/laser_i2c.ko 
insmod /lib/modules/3.4.11-rt19/extra/bcm_enet.ko 
# moving pktrunner after bcm_enet to get better FlowCache ICache performance
insmod /lib/modules/3.4.11-rt19/extra/pktrunner.ko 
 
#load SATA/AHCI modules
 
# pcie configuration save/restore
# WLAN accelerator module
insmod /lib/modules/3.4.11-rt19/extra/wfd.ko 
 
#WLAN Module
insmod /lib/modules/3.4.11-rt19/extra/wlemf.ko 
insmod /lib/modules/3.4.11-rt19/extra/wl.ko 
 
#load usb modules
insmod /lib/modules/3.4.11-rt19/kernel/drivers/usb/storage/usb-storage.ko 
 
# other modules
 
insmod /lib/modules/3.4.11-rt19/extra/bcmvlan.ko 
 
insmod /lib/modules/3.4.11-rt19/extra/laser_dev.ko 
 
# presecure fullsecure modules
insmod /lib/modules/3.4.11-rt19/extra/otp.ko 
 
insmod /lib/modules/3.4.11-rt19/extra/pmd.ko 
 
# RDPA Command Drivers
insmod /lib/modules/3.4.11-rt19/extra/rdpa_cmd.ko 
 
# OCF and PKA modules
 
# LTE PCIE driver module

 test -e /etc/rdpa_init.sh && /etc/rdpa_init.sh

 test -e /etc/loadclm.sh && /etc/loadclm.sh

# Enable the PKA driver.
 test -e /sys/devices/platform/bcm_pka/enable && echo 1 > /sys/devices/platform/bcm_pka/enable

exit 0
		;;

	stop)
		echo "removing bcm base drivers not implemented yet..."
		exit 1
		;;

	*)
		echo "bcmbasedrivers: unrecognized option $1"
		exit 1
		;;

esac


