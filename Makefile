#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kumasocks
PKG_VERSION:=1.0
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
	[ ! -f $(PKG_BUILD_DIR)/kumasocks-$(PKG_VERSION)-$(PKG_ARCH_KUMASOCKS).zip ] && wget https://github.com/xsm1997/KumaSocks/releases/download/$(PKG_VERSION)/kumasocks-$(PKG_ARCH_KUMASOCKS).zip -O $(PKG_BUILD_DIR)/kumasocks-$(PKG_VERSION)-$(PKG_ARCH_KUMASOCKS).zip
	unzip -o $(PKG_BUILD_DIR)/kumasocks-$(PKG_VERSION)-$(PKG_ARCH_KUMASOCKS).zip -d $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
	chmod +x $(PKG_BUILD_DIR)/kumasocks
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/kumasocks $(1)/usr/bin/kumasocks
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
