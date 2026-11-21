#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192\.168\.6\.1/192.168.7.1/' package/base-files/files/bin/config_generate

# Keep the same Aurora theme and configuration app as the AX3000T build.
sed -i 's/luci-theme-bootstrap/luci-theme-aurora/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-argon/luci-theme-aurora/g' feeds/luci/collections/luci/Makefile

git clone --depth 1 https://github.com/eamonxg/luci-theme-aurora.git package/luci-theme-aurora
git clone --depth 1 https://github.com/eamonxg/luci-app-aurora-config.git package/luci-app-aurora-config
git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome

# Force installation of packages from their intended feeds.
./scripts/feeds install -a -f -p passwall_packages
./scripts/feeds install -a -f -p passwall
./scripts/feeds install -a -f -p passwall2
./scripts/feeds install -a -f -p helloworld
./scripts/feeds install -a -f -p openclash

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
