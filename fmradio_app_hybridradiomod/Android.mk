LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := HybridRadioMod
LOCAL_MODULE_TAGS := optional
# # tell dexopt not to try resigning the apks
# LOCAL_CERTIFICATE := PRESIGNED
# for selinux, if an app certificate is "platform", then it'll be in "platform_app" domain. https://stackoverflow.com/questions/39387078/android-n-priv-app-application
# LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk

include $(BUILD_PREBUILT)
