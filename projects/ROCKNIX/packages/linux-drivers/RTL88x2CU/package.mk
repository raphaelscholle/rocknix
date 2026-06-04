# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026 ROCKNIX

PKG_NAME="RTL88x2CU"
PKG_VERSION="85dbdb27e3e32ac8f9c820bc318db094f3f81224"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/OpenHD/rtl88x2cu"
PKG_URL="${PKG_SITE}.git"
PKG_LONGDESC="Realtek 88x2CU driver"
PKG_TOOLCHAIN="make"
PKG_IS_KERNEL_PKG="yes"
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="master"
PKG_GIT_CLONE_SINGLE="yes"
PKG_GIT_CLONE_DEPTH="1"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=y
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/kernel/drivers/net/wireless/
    cp *.ko ${INSTALL}/$(get_full_module_dir)/kernel/drivers/net/wireless/
}
