# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ROCKNIX

PKG_NAME="openhd"
PKG_VERSION="f92e4f90a722d926fc1b269a62091d1b3f885d83"
PKG_LICENSE="GPL-3.0-only"
PKG_SITE="https://github.com/OpenHD/OpenHD"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain cmake:host poco libsodium gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav libpcap libusb libnl iw i2c-tools v4l-utils SDL2 Python3:host"
PKG_LONGDESC="OpenHD digital FPV core service."
PKG_TOOLCHAIN="cmake"
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="openhd-3.0"
PKG_GIT_CLONE_SINGLE="yes"
PKG_GIT_CLONE_DEPTH="1"
PKG_GIT_SUBMODULE_DEPTH="1"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION}/OpenHD"

PKG_CMAKE_OPTS_TARGET="-DENABLE_AIR=ON \
                       -DENABLE_USB_CAMERAS=ON"

post_makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/systemd/system
  cp ${PKG_DIR}/system.d/openhd.service ${INSTALL}/usr/lib/systemd/system

  enable_service openhd.service
}
