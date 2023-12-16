#!/sbin/sh

# ASH_STANDALONE=1
PATH=/system/bin

### INSTALLATION ###

if [ "$BOOTMODE" != true ]; then
  ui_print "-----------------------------------------------------------"
  ui_print "! Please install in Magisk Manager or KernelSU Manager"
  ui_print "! Install from recovery is NOT supported"
  abort "-----------------------------------------------------------"
elif [ "$KSU" = true ] && [ "$KSU_VER_CODE" -lt 10670 ]; then
  abort "ERROR: Please update your KernelSU and KernelSU Manager"
fi

# check android
if [ "$API" -lt 28 ]; then
  ui_print "! Unsupported sdk: $API"
  abort "! Minimal supported sdk is 28 (Android 9)"
else
  ui_print "- Device sdk: $API"
fi

# check version
service_dir="/data/adb/service.d"
if [ "$KSU" = true ]; then
  ui_print "- kernelSU version: $KSU_VER ($KSU_VER_CODE)"
  [ "$KSU_VER_CODE" -lt 10683 ] && service_dir="/data/adb/ksu/service.d"
else
  ui_print "- Magisk version: $MAGISK_VER ($MAGISK_VER_CODE)"
fi

if [ ! -d "${service_dir}" ]; then
  mkdir -p "${service_dir}"
fi

ui_print "- Installing ZerotierOne for Magisk"

if [ ! -d "/data/adb/tailscale" ]; then
  mkdir -p /data/adb/tailscale
  set_perm /data/adb/tailscale 0 0 0755
fi

mv -f $MODPATH/tailscale_service.sh $service_dir/
ui_print "- Patching executable file"
mkdir -p $MODPATH$PATH
mv -f $MODPATH/tailscale $MODPATH$PATH
mv -f $MODPATH/tailscale-sv $MODPATH$PATH
mv -f $MODPATH/tailscaled $MODPATH$PATH
  
ui_print "- Setting permissions"
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm ${service_dir}/tailscale_service.sh  0  0  0755
set_perm $MODPATH$PATH/tailscale  0  0  0755
set_perm $MODPATH$PATH/tailscaled  0  0  0755
set_perm $MODPATH$PATH/tailscale-sv  0  0  0755

ui_print "- Installation is complete, reboot your device"