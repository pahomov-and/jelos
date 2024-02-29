# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="mygui"
PKG_LICENSE="GPLv3"
PKG_VERSION="3.4.1"
PKG_SHA256="bdf730bdeb4ad89e6b8223967db01aa5274d2b93adc2c0d6aa4842faeed4de1a"
PKG_SITE="https://github.com/MyGUI/${PKG_NAME}"
PKG_URL="${PKG_SITE}/archive/refs/tags/MyGUI${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="toolchain"
PKG_DEPENDS_TARGET="toolchain SDL2"
#libpng
PKG_LONGDESC="MyGUI is a cross-platform library for creating graphical user interfaces (GUIs) for games and 3D applications."
#GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="cmake"

PKG_CMAKE_OPTS_TARGET+="  -DMYGUI_RENDERSYSTEM=4 \
                          -DMYGUI_BUILD_DEMOS=OFF \
                          -DMYGUI_BUILD_TOOLS=OFF \
                          -DMYGUI_BUILD_PLUGINS=ON \
                          -DCMAKE_BUILD_TYPE=Release"

#if [ ! "${OPENGL}" = "no" ]; then
#  PKG_DEPENDS_TARGET+=" ${OPENGL} glu"
#  PKG_CMAKE_OPTS_TARGET+=" -DMYGUI_RENDERSYSTEM=4"
#else
#  PKG_CMAKE_OPTS_TARGET+=" -DMYGUI_RENDERSYSTEM=1"
#fi

#if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
#  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
#  PKG_CMAKE_OPTS_TARGET+=" -DMYGUI_RENDERSYSTEM=8"
#else
#  PKG_CMAKE_OPTS_TARGET+=""
#fi


#pre_configure_target() {
#
#  PKG_CMAKE_OPTS_TARGET+="  -DMYGUI_RENDERSYSTEM=8 \
#                            -DCMAKE_BUILD_TYPE=Release"
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
