# Tailscale for Magisk

[README](README.md) | [中文文档](README_zh.md)

[![GitHub Release](https://img.shields.io/github/v/release/linuxscreen/TailscaleForMagisk)](https://github.com/linuxscreen/TailscaleForMagisk/releases)
[![GitHub Download](https://img.shields.io/github/downloads/linuxscreen/TailscaleForMagisk/total)](https://github.com/linuxscreen/TailscaleForMagisk/releases)

Tailscale[面具](https://github.com/topjohnwu/Magisk)模块，支持Magisk和kernelSU

# 免责声明
本项目不对以下情况负责：设备变砖、SD 卡损坏或 SoC 烧毁。

# 使用方法
安装模块之后会在系统后台运行

可执行文件`tailscale-sv`、`tailscaled`、`tailscale` 会复制到`/system/bin`，切换root后，可以直接运行命令

```bash
tailscale-sv status
already logged in,management address:http://localhost:8088,check the status excute`tailscale status` by terminal
```

启动、重启、停止tailscaled服务

```
tailscale-sv start
tailscale-sv restart
tailscale-sv stop
```

登陆tailscale

- 直接访问web管理页面: http://localhost:8088

- ```
  # 执行命令
  tailscale login

tailscale数据存储在/data/adb/tailscale

# 卸载

- 从 Magisk Manager应用卸载本模块，会删除 `/data/adb/service.d/tailscale_service.sh` 文件，保留数据目录 `/data/adb/tailscale`

- 可使用命令清除数据：`rm -rf /data/adb/tailscale`
