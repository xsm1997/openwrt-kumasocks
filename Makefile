#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kumasocks
PKG_VERSION:=1.2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=kumasocks
	URL:=https://github.com/xsm1997/KumaSocks
endef

define Package/$(PKG_NAME)/description
A light-weighted transparent proxy to socks5 converter written in Golang.
endef

ifeq ($(ARCH),x86_64)
	PKG_ARCH_KUMASOCKS:=amd64
endif
ifeq ($(ARCH),mipsel)
	PKG_ARCH_KUMASOCKS:=mipsle
endif
ifeq ($(ARCH),mips)
	PKG_ARCH_KUMASOCKS:=mips
endif
ifeq ($(ARCH),arm)
	PKG_ARCH_KUMASOCKS:=arm
endif
ifeq ($(ARCH),aarch64)
	PKG_ARCH_KUMASOCKS:=arm64
endif

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/$(PKG_ARCH_KUMASOCKS)/kumasocks $(1)/usr/bin/kumasocks
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
