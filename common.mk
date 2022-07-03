#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/samsung/sm8150-common

PRODUCT_TARGET_VNDK_VERSION := 29

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Proprietary blobs
$(call inherit-product-if-exists, vendor/samsung/sm8150-common/sm8150-common-vendor.mk)

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay \
    $(COMMON_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS += *

# Audio 
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Camera
PRODUCT_PACKAGES += \
    Snap

# FM Radio (Qualcomm)
# PRODUCT_PACKAGES += \
    # FM2 \
    # libqcomfm_jni \
    # qcom.fmradio

# PRODUCT_BOOT_JARS += qcom.fmradio

# Prebuilt (Richwave FM Radio)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(COMMON_PATH)/fmradio_prebuilt/system_root/system,system)

PRODUCT_PACKAGES += \
    HybridRadioMod

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/com.android.hotwordenrollment.common.util.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.android.hotwordenrollment.common.util.xml \
    $(COMMON_PATH)/configs/hotword-hiddenapi-package-allowlist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hotword-hiddenapi-package-allowlist.xml \
    $(COMMON_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc

# OTA Updater
AB_OTA_UPDATER := false

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.sm8150-libperfmgr

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/powerhint.json

# Recovery
PRODUCT_PACKAGES += \
    fastbootd \
    init.recovery.qcom.rc

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.sm8150-multihal

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Touch
PRODUCT_PACKAGES += \
    lineage.touch@1.0-service.sm8150

# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlay
