# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026 ROCKNIX

PKG_NAME="RTL88x2EU"
PKG_VERSION="e010a6eaf76566c3964282c950d4946e11366cc5"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/OpenHD/rtl88x2eu"
PKG_URL="${PKG_SITE}.git"
PKG_LONGDESC="Realtek 88x2EU driver"
PKG_TOOLCHAIN="make"
PKG_IS_KERNEL_PKG="yes"
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="stock_2026_driver"
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
