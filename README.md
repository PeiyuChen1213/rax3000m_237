# CMCC RAX3000M NAND — ImmortalWrt 237

This GitHub Actions workflow builds the NAND / MTK-layout image for the CMCC RAX3000M using the 237 source branch:

- Source: `padavanonly/immortalwrt-mt798x-6.6`
- Branch: `openwrt-24.10-6.6`
- Device profile: `cmcc_rax3000m` (NAND)
- Kernel line: Linux 6.6
- Default LAN address: `192.168.7.1`
- Wi-Fi driver: 237 source's RAX profile selects `kmod-mt7915e`; this build does not carry over the AX3000T `mt_wifi` driver configuration.
- LuCI theme: Aurora, matching the AX3000T 237 build

The package selection is based on 237's MT7981 configuration without its proprietary Wi-Fi driver and adds FRPC with its LuCI app, SSR Plus, OpenClash, PassWall 2, and the AdGuardHome LuCI app. Simplified Chinese LuCI translations are enabled. The AdGuardHome core is downloaded and managed from its LuCI app after first boot.

## Build

Open **Actions → OpenWrt Builder → Run workflow**. The workflow uploads the firmware files as an artifact and publishes a release. This repository selects the RAX3000M NAND profile; it does not build an eMMC image.

The workflow builds firmware only. It does not connect to or modify a router.
