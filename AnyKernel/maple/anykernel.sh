# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=pop kernel by linckandrea @ xda-developers
do.devicecheck=0
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=auto;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.qcom.power.rc
# remove mpdecision
remove_line "/system/vendor/etc/init/hw/init.qcom.rc" "start mpdecision";

remove_line "/system/vendor/etc/init/hw/init.qcom.rc" "write /sys/module/cpu_boost/parameters/boost_ms 20";
remove_line "/system/vendor/etc/init/hw/init.qcom.rc" "write /sys/module/cpu_boost/parameters/sync_threshold 1728000";
remove_line "/system/vendor/etc/init/hw/init.qcom.rc" "write /sys/module/cpu_boost/parameters/input_boost_freq 1497600";
remove_line "/system/vendor/etc/init/hw/init.qcom.rc" "write /sys/module/cpu_boost/parameters/input_boost_ms 40";

replace_string "/system/vendor/etc/init/hw/init.qcom.rc" "230000" "300000" "230000" "global"

# add Pop kernel Script
ui_print "- Applying Pop kernel init patch in /system/vendor"
cp /tmp/anykernel/ramdisk/init.pop.rc /system/vendor/etc/init/hw/init.pop.rc;
insert_line "/system/vendor/etc/init/hw/init.qcom.rc" "init.pop.rc" after "import /vendor/etc/init/hw/init.target.rc" "import /vendor/etc/init/hw/init.pop.rc";
chmod 644 /system/vendor/etc/init/hw/init.pop.rc;
# end ramdisk changes

write_boot;
## end install

