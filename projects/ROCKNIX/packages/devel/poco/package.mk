# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2026 ROCKNIX

PKG_NAME="poco"
PKG_VERSION="6911178c17bdc0a9f7b016236957f01c0548f572"
PKG_LICENSE="BSL-1.0"
PKG_SITE="https://github.com/pocoproject/poco"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain cmake:host zlib pcre2 sqlite openssl"
PKG_LONGDESC="The POCO C++ Libraries."
PKG_TOOLCHAIN="cmake"
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="poco-1.14.2-release"
PKG_GIT_CLONE_SINGLE="yes"
PKG_GIT_CLONE_DEPTH="1"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SHARED_LIBS=ON \
                       -DENABLE_TESTS=OFF \
                       -DENABLE_SAMPLES=OFF \
                       -DENABLE_ACTIVERECORD=OFF \
                       -DENABLE_ACTIVERECORD_COMPILER=OFF \
                       -DENABLE_APACHECONNECTOR=OFF \
                       -DENABLE_CPPPARSER=OFF \
                       -DENABLE_CRYPTO=OFF \
                       -DENABLE_DATA=OFF \
                       -DENABLE_ENCODINGS=OFF \
                       -DENABLE_ENCODINGS_COMPILER=OFF \
                       -DENABLE_JSON=OFF \
                       -DENABLE_JWT=OFF \
                       -DENABLE_MONGODB=OFF \
                       -DENABLE_NET=ON \
                       -DENABLE_NETSSL=OFF \
                       -DENABLE_PAGECOMPILER=OFF \
                       -DENABLE_PAGECOMPILER_FILE2PAGE=OFF \
                       -DENABLE_PDF=OFF \
                       -DENABLE_PROMETHEUS=OFF \
                       -DENABLE_REDIS=OFF \
                       -DENABLE_SEVENZIP=OFF \
                       -DENABLE_UTIL=OFF \
                       -DENABLE_XML=OFF \
                       -DENABLE_ZIP=OFF"
