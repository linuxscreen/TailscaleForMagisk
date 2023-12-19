# Tailscale for Magisk

[README](README.md) | [中文文档](README_zh.md)

[![GitHub Release](https://img.shields.io/github/v/release/linuxscreen/TailscaleForMagisk)](https://github.com/linuxscreen/TailscaleForMagisk/releases)
[![GitHub Download](https://img.shields.io/github/downloads/linuxscreen/TailscaleForMagisk/total)](https://github.com/linuxscreen/TailscaleForMagisk/releases)

The project is a [Magisk](https://github.com/topjohnwu/Magisk) module for Tailscale, Support Magisk and KernelSU

# Disclaimer
The project is not responsible for bricked equipment, damaged SD cards, or burned SoC

# Usage
After the module is installed, it runs in the background

Executable file `tailscale-sv`、`tailscaled`、`tailscale` will copy to `/system/bin` ,You can directly run commands as the root user by terminal

```bash
tailscale-sv status
already logged in,management address:http://localhost:8088,check the status excute`tailscale status` by terminal
```

Start, restart, stop tailscaled service

```
tailscale-sv start
tailscale-sv restart
tailscale-sv stop
```

Login in tailscale

- Direct access to the web administration page: http://localhost:8088

- ```
  # Executive command
  tailscale login
  ```
tailscale data will storage in /data/adb/tailscale

# Uninstall

- Uninstall this module from the Magisk Manager application，will delete `/data/adb/service.d/tailscale_service.sh`，Reserved data directory `/data/adb/tailscale`

- You can use commands to clear data: `rm -rf /data/adb/tailscale`

