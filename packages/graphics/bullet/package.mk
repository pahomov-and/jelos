# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="bullet"
PKG_VERSION="45aa392a280d2020946f5ee112f73072bbab6001"
PKG_LICENSE="GPLv3"
PKG_URL="https://github.com/bulletphysics/bullet3.git"
PKG_GIT_CLONE_BRANCH="2.86.1"
#PKG_DEPENDS_HOST="toolchain SDL2:host zmusic:host libvpx:host libwebp:host"
PKG_DEPENDS_TARGET="toolchain glu"
PKG_LONGDESC="Bullet"
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="cmake"


#pre_configure_target() {

  PKG_CMAKE_OPTS_TARGET+="  -DUSE_DOUBLE_PRECISION=ON \
                            -DBULLET2_MULTITHREADING=ON \
                            -DBUILD_CPU_DEMOS=OFF \
                            -DBUILD_OPENGL3_DEMOS=OFF \
                            -DBUILD_BULLET2_DEMOS=OFF \
                            -DBUILD_UNIT_TESTS=OFF"

#  PKG_CMAKE_OPTS_TARGET+=" -DBUILD_BSATOOL=OFF \
#                          -DBUILD_ESMTOOL=OFF \
#                          -DBUILD_LAUNCHER=OFF \
#                          -DBUILD_MWINIIMPORTER=OFF \
#                          -DBUILD_ESSIMPORTER=OFF \
#                          -DBUILD_OPENCS=OFF \
#                          -DBUILD_WIZARD=OFF \
#                          -DBUILD_MYGUI_PLUGIN=OFF \
#                          -DMYGUI_STATIC=ON \
#                          -DBOOST_STATIC=ON \
#                          -DCMAKE_BUILD_TYPE=Release"

#  PKG_CMAKE_OPTS_TARGET+=" -DNO_GTK=ON \
#                           -DFORCE_CROSSCOMPILE=ON \
#                           -DIMPORT_EXECUTABLES=${PKG_BUILD}/.${HOST_NAME}/ImportExecutables.cmake \
#                           -DCMAKE_BUILD_TYPE=Release \
#                           -DZMUSIC_LIBRARIES=${SYSROOT_PREFIX}/usr/lib/libzmusic.so -DZMUSIC_INCLUDE_DIR=${SYSROOT_PREFIX}/usr/include"
  ### Enable GLES on devices that don't support OpenGL.
#  if [ ! "${OPENGL_SUPPORT}" = "yes" ]
#  then
#    PKG_CMAKE_OPTS_TARGET+=" -DHAVE_GLES2=ON"
#  fi

  ### Enable vulkan support on devices that have it available.
#  if [ "${VULKAN_SUPPORT}" = "yes" ]
#  then
#    PKG_CMAKE_OPTS_TARGET+=" -DHAVE_VULKAN=ON"
#  else
#    PKG_CMAKE_OPTS_TARGET+=" -DHAVE_VULKAN=OFF"
#  fi
#}

#makeinstall_target() {

#  mkdir -p ${INSTALL}/usr/bin
#  cp ${PKG_BUILD}/.${TARGET_NAME}/gzdoom ${INSTALL}/usr/bin
#  cp ${PKG_DIR}/scripts/start_gzdoom.sh ${INSTALL}/usr/bin/
#  chmod +x ${INSTALL}/usr/bin/*

#  mkdir -p ${INSTALL}/usr/config/gzdoom
#  cp ${PKG_DIR}/config/* ${INSTALL}/usr/config/gzdoom
#  cp ${PKG_BUILD}/.${TARGET_NAME}/*.pk3 ${INSTALL}/usr/config/gzdoom
#  cp -r ${PKG_BUILD}/.${TARGET_NAME}/soundfonts ${INSTALL}/usr/config/gzdoom
#  cp -r ${PKG_BUILD}/.${TARGET_NAME}/fm_banks ${INSTALL}/usr/config/gzdoom
#}
