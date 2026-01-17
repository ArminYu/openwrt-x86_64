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

# ------------------------------- Main source started -------------------------------

# 更改默认 Shell 为 zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# 添加额外插件
git clone --depth=1 -b master https://github.com/fw876/helloworld package/luci-app-ssr-plus

# Themes
# git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# git clone --depth=1 -b master https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

#修改默认主题
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")

# 修改默认IP
sed -i 's/192.168.1.1/192.168.1.9/g' package/base-files/luci2/bin/config_generate

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

./scripts/feeds update -a
./scripts/feeds install -a

# ------------------------------- Main source ends -------------------------------
