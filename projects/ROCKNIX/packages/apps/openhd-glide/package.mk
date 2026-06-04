# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ROCKNIX

PKG_NAME="openhd-glide"
PKG_VERSION="9031c8aec5e4a516a99bf3324d3d4f7b760eac8c"
PKG_LICENSE="GPL-3.0-only"
PKG_SITE="https://github.com/raphaelscholle/openhd-glide"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain cmake:host zlib libdrm mesa freetype SDL2 gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav v4l-utils rkmpp librga"
PKG_LONGDESC="OpenHD Glide DRM/KMS rendering stack."
PKG_TOOLCHAIN="cmake"
GET_HANDLER_SUPPORT="git"

PKG_CMAKE_OPTS_TARGET="-DOPENHD_GLIDE_DEVICE_KMS=ON \
                       -DOPENHD_GLIDE_WARNINGS_AS_ERRORS=OFF \
                       -DCMAKE_EXE_LINKER_FLAGS=-shared-libgcc \
                       -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
                       -DFETCHCONTENT_FULLY_DISCONNECTED=OFF"

PKG_MAKE_OPTS_TARGET="-v"

pre_make_target() {
  echo "openhd-glide CMake feature detection:"
  grep -E "^(ROCKCHIP_MPP|GSTREAMER|LIBDRM|GBM|EGL|GLESV2|FREETYPE)_" CMakeCache.txt || true
}

post_makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/systemd/system
  cp ${PKG_DIR}/system.d/openhd-glide.service ${INSTALL}/usr/lib/systemd/system

  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_DIR}/scripts/start_openhd_glide.sh ${INSTALL}/usr/bin
  chmod 0755 ${INSTALL}/usr/bin/start_openhd_glide.sh

  mkdir -p ${INSTALL}/usr/lib/autostart/common
  cp ${PKG_DIR}/autostart/090-openhd-glide ${INSTALL}/usr/lib/autostart/common
  chmod 0755 ${INSTALL}/usr/lib/autostart/common/090-openhd-glide
}
