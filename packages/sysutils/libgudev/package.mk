# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2026 OpenHD

PKG_NAME="libgudev"
PKG_VERSION="238"
PKG_SHA256="61266ab1afc9d73dbc60a8b2af73e99d2fdff47d99544d085760e4fa667b5dd1"
PKG_LICENSE="LGPL-2.1-or-later"
PKG_SITE="https://wiki.gnome.org/Projects/libgudev"
PKG_URL="https://download.gnome.org/sources/libgudev/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain glib systemd"
PKG_LONGDESC="GObject bindings for libudev."
PKG_TOOLCHAIN="meson"

PKG_MESON_OPTS_TARGET="-Dtests=disabled \
                       -Dintrospection=disabled \
                       -Dvapi=disabled \
                       -Dgtk_doc=false"

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/share
}
