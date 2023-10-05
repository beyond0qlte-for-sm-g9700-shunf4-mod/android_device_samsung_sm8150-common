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
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    audio.bluetooth.default \
    audio.primary.msmnile

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Camera
PRODUCT_PACKAGES += \
    Aperture

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    android.hardware.graphics.composer@2.4-service \
    hwcomposer.msmnile


# FM Radio (Qualcomm)
# PRODUCT_PACKAGES += \
    # FM2 \
    # libqcomfm_jni \
    # qcom.fmradio

# PRODUCT_BOOT_JARS += qcom.fmradio

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.samsung-beyond0qlte


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

# Init files and fstab
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.factory.rc \
    init.qcom.usb.rc \
    init.qti.ufs.rc \
    init.samsung.bsp.rc \
    init.samsung.display.rc \
    init.samsung.rc \
    init.target.rc \
    init.fingerprint.rc \
    init.nfc.samsung.rc \
    init.qti.qcv.rc \
    init.ramplus.rc \
    init.spdaemon.rc \
    init.time_daemon.rc \
    init.vendor.rilcarrier.rc \
    init.vendor.rilchip.rc \
    init.vendor.rilcommon.rc \
    init.vendor.sensors.rc \
    init.vendor.sysfw.rc \
    vaultkeeper_common.rc \
    fstab.ramplus

# Init scripts from vendor
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.mdm.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.chg_policy.sh \
    init.qti.dcvs.sh \
    init.qti.keymaster.sh \
    init.qti.qcv.sh

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(COMMON_PATH)/rootdir/vendor/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# Keymaster
# PRODUCT_PACKAGES += \
#     android.hardware.keymaster@4.0-service.samsung \
#     android.hardware.keymaster@4.1.vendor \
#     libkeymaster4_1support.vendor

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

PRODUCT_SOONG_NAMESPACES += \
    hardware/samsung/aidl/power-libperfmgr \
    hardware/samsung

PRODUCT_PACKAGES += \
    android.hardware.power-service.samsung-libperfmgr

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(COMMON_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
PRODUCT_PACKAGES += \
    fastbootd \
    init.recovery.qcom.rc

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.samsung-multihal \
    libsensorndkbridge

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
