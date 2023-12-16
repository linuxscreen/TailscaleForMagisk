#!/system/bin/sh

if [ -f "/data/adb/ksu/service.d/tailscale_service.sh" ]; then
  rm -f "/data/adb/ksu/service.d/tailscale_service.sh"
fi

if [ -f "/data/adb/service.d/tailscale_service.sh" ]; then
  rm -f "/data/adb/service.d/tailscale_service.sh"
fi