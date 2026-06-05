# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="RTL8812AU"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/OpenHD/rtl8812au"
PKG_URL="${PKG_SITE}.git"
PKG_GIT_CLONE_BRANCH="v5.6.4.2"
PKG_VERSION="$(git ls-remote "${PKG_URL}" "refs/heads/${PKG_GIT_CLONE_BRANCH}" | awk '{ print $1 }')"
PKG_LONGDESC="Realtek 8812AU driver for 4.4-5.x"
PKG_TOOLCHAIN="make"
PKG_IS_KERNEL_PKG="yes"
GET_HANDLER_SUPPORT="git"
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
