# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="openmw"
PKG_VERSION="81ab0feb2ec2fda488eec043f6fa3d9b020f1521"
PKG_LICENSE="GPLv3"
PKG_SITE="https://gitlab.com/OpenMW/openmw"
PKG_URL="${PKG_SITE}.git"
PKG_GIT_CLONE_BRANCH="openmw-0.48.0"
#PKG_DEPENDS_HOST="toolchain SDL2:host zmusic:host libvpx:host libwebp:host"

#PKG_DEPENDS_HOST="toolchain OpenSceneGraph"
#PKG_DEPENDS_HOST="toolchain:host bullet:host"
#PKG_DEPENDS_TARGET="toolchain SDL2 sqlite luajit openal-soft boost yaml-cpp lz4 bzip2 libzip openal-soft icu ffmpeg bullet OpenSceneGraph mygui zlib fontconfig qt5"
PKG_DEPENDS_TARGET="toolchain SDL2 sqlite luajit openal-soft boost yaml-cpp lz4 openal-soft icu ffmpeg bullet OpenSceneGraph mygui zlib fontconfig qt5"
PKG_LONGDESC="OpenMW"
GET_HANDLER_SUPPORT="git"
#PKG_TOOLCHAIN="cmake-make"
PKG_TOOLCHAIN="cmake"
# PKG_BUILD_FLAGS="+pic"

#PKG_CONFIGURE_OPTS_TARGET="--with-sysroot=${SYSROOT_PREFIX}"


pre_configure_target() {

#                            -DBOOST_STATIC=ON \

#  PKG_CMAKE_OPTS_TARGET+="  -DBUILD_BSATOOL=OFF \
#                            -DBUILD_ESMTOOL=OFF \
#                            -DBUILD_LAUNCHER=OFF \
#                            -DBUILD_MWINIIMPORTER=OFF \
#                            -DBUILD_ESSIMPORTER=OFF \
#                            -DBUILD_OPENCS=OFF \
#                            -DBUILD_WIZARD=OFF \
#                            -DBUILD_MYGUI_PLUGIN=OFF \
#                            -DBUILD_NIFTEST=OFF \
#                            -DBUILD_NAVMESHTOOL=OFF \
#                            -DBUILD_BULLETOBJECTTOOL=OFF \
#                            -DBUILD_DOCS=OFF \
#                            -DOPENMW_USE_SYSTEM_OSG=OFF \
#                            -DOPENMW_USE_SYSTEM_BULLET=OFF \
#                            -DOSG_STATIC=ON \
#                            -DMYGUI_STATIC=ON \
#                            -DBOOST_STATIC=ON \
#                            -DMyGUI_LIBRARY=${SYSROOT_PREFIX}/usr/lib \
#                            -DCOMPILE_DEFINITIONS_LIST:BT_THREADSAFE=1 \
#                            -DCMAKE_BUILD_TYPE=Release"

#                            -DOPENMW_USE_SYSTEM_MYGUI=OFF \
#                            -DMyGUI_LIBRARY=${SYSROOT_PREFIX}/usr/lib \
#                            -DOPENMW_USE_SYSTEM_OSG=OFF \

  PKG_CMAKE_OPTS_TARGET+="  -DBUILD_DOCS=OFF \
                            -DBUILD_WIZARD=OFF \
                            -DBOOST_STATIC=ON \
                            -DQT_STATIC=ON \
                            -DOSG_STATIC=ON \
                            -DOPENMW_USE_SYSTEM_MYGUI=OFF \
                            -DOPENMW_USE_SYSTEM_BULLET=OFF \
                            -DOPENMW_USE_SYSTEM_RECASTNAVIGATION=OFF \
                            -DOPENMW_USE_SYSTEM_SQLITE3=OFF \
                            -DCMAKE_BUILD_TYPE=Release"

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
