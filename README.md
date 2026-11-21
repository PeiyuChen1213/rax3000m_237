# CMCC RAX3000M NAND — ImmortalWrt 237

This GitHub Actions workflow builds the NAND / MTK-layout image for the CMCC RAX3000M using the 237 source branch:

- Source: `padavanonly/immortalwrt-mt798x-6.6`
- Branch: `openwrt-24.10-6.6`
- Device profile: `cmcc_rax3000m` (NAND)
- Kernel line: Linux 6.6
- Default LAN address: `192.168.7.1`
- Wi-Fi: uses the RAX3000M MTK `mt_wifi` driver from the 237 source, with `wifi-scripts`, `mtwifi-cfg`, and the MTK LuCI wireless page.
- LuCI theme: Aurora, matching the AX3000T 237 build

The image includes FRPC, SSR Plus, OpenClash, PassWall 2 (the old PassWall app is disabled), and AdGuardHome. It also includes MTK EQoS bandwidth control, TurboACC, `wrtbwmon` traffic history, USB storage support, disk management, and KSmbd for USB file sharing. Simplified Chinese LuCI translations are enabled. The AdGuardHome core is downloaded and managed from its LuCI app after first boot.

## Build

Open **Actions → OpenWrt Builder → Run workflow**. The workflow uploads the firmware files as an artifact and publishes a release. This repository selects the RAX3000M NAND profile; it does not build an eMMC image.

The workflow builds firmware only. It does not connect to or modify a router.
