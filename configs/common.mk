#
# Copyright (C) 2020 Lucid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit art options
include vendor/lucid/configs/art.mk

# Fonts
include vendor/lucid/configs/fonts.mk

# Common overlays
DEVICE_PACKAGE_OVERLAYS += vendor/lucid/overlay

# Packages
include vendor/lucid/configs/packages.mk

# Include support for GApps backup
PRODUCT_COPY_FILES += \
    vendor/lucid/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/lucid/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/lucid/prebuilt/bin/50-backuptool.sh:system/addon.d/50-backuptool.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/lucid/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/lucid/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/lucid/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    vendor/lucid/configs/permissions/privapp-permissions-lucid-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-lucid.xml \
    vendor/lucid/configs/permissions/privapp-permissions-lucid-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-lucid.xml

# World APN list
PRODUCT_COPY_FILES += \
    vendor/lucid/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/lucid/configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Branding stuffs
include vendor/lucid/configs/branding.mk

# Props
include vendor/lucid/configs/props.mk
