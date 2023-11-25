# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020 The LineageOS Project

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := vendor.lineage.touch@1.0-service.samsung.sm8150.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)/init
LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_PATH := hardware/samsung/hidl/touch

include $(CLEAR_VARS)

LOCAL_MODULE := vendor.lineage.touch@1.0-service.sm8150
LOCAL_MODULE_STEM := vendor.lineage.touch@1.0-service.sm8150
LOCAL_MODULE_TAGS  := optional

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SRC_FILES := \
    GloveMode.cpp \
    KeyDisabler.cpp \
    StylusMode.cpp \
    TouchscreenGesture.cpp \
    service.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_REQUIRED_MODULES := \
    vendor.lineage.touch@1.0-service.samsung.sm8150.rc

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libbinder \
    libhidlbase \
    libutils \
    vendor.lineage.touch@1.0

LOCAL_VENDOR_MODULE := true

include $(BUILD_EXECUTABLE)
