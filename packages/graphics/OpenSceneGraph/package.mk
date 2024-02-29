# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="OpenSceneGraph"
#PKG_VERSION="a827840baf0786d72e11ac16d5338a4ee25779db"
PKG_LICENSE="GPLv3"
#PKG_URL="https://github.com/openscenegraph/OpenSceneGraph.git"
#PKG_GIT_CLONE_BRANCH="OpenSceneGraph-3.6.5"
#PKG_DEPENDS_HOST="toolchain SDL2:host zmusic:host libvpx:host libwebp:host"
PKG_VERSION="3.6.5"
PKG_SHA256="aea196550f02974d6d09291c5d83b51ca6a03b3767e234a8c0e21322927d1e12"
PKG_SITE="https://github.com/openscenegraph/OpenSceneGraph"
PKG_URL="${PKG_SITE}/archive/refs/tags/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="toolchain"
PKG_DEPENDS_TARGET="toolchain zlib ffmpeg"
#libpng
PKG_LONGDESC="OpenSceneGraph"
#GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="cmake"


pre_configure_target() {

  PKG_CMAKE_OPTS_TARGET+="  -DBUILD_OSG_APPLICATIONS=ON \
                            -DOPENTHREADS_ATOMIC_USE_MUTEX=ON \
                            -DOPENGL_PROFILE=GL2 \
                            -DDYNAMIC_OPENTHREADS=OFF \
                            -DDYNAMIC_OPENSCENEGRAPH=OFF \
                            -DCMAKE_BUILD_TYPE=release"

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
}

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
