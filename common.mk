#
# Copyright 2026 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this fildfhfghgffghfghe except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit AOSP common base configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl-wrapper.recovery \
    android.hardware.boot@1.0-impl-wrapper \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.trinket \
    bootctrl.trinket.recovery

PRODUCT_PACKAGES += \
    libgptutils.trinket \
    libgptutils.trinket.recovery

# Packages for decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_HOST_PACKAGES += \
    libandroidicu

# Properties for decryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=trinket \
    ro.hardware.gatekeeper=trinket \
    ro.hardware.bootctrl=trinket

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH)

# tzdata
PRODUCT_PACKAGES += \
    tzdata_twrp

# Copy files to recovery ramdisk

# Init scripts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc \
    $(COMMON_PATH)/recovery/root/init.recovery.usb.rc:recovery/root/init.recovery.usb.rc

# Configuration files
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/product/etc/fstab.postinstall:recovery/root/product/etc/fstab.postinstall \
    $(COMMON_PATH)/recovery/root/system/etc/event-log-tags:recovery/root/system/etc/event-log-tags \
    $(COMMON_PATH)/recovery/root/system/etc/fstab.postinstall:recovery/root/system/etc/fstab.postinstall \
    $(COMMON_PATH)/recovery/root/system/etc/task_profiles.json:recovery/root/system/etc/task_profiles.json

# Vintf manifests
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/system/etc/vintf/manifest.xml:recovery/root/system/etc/vintf/manifest.xml \
    $(COMMON_PATH)/recovery/root/vendor/etc/vintf/manifest.xml:recovery/root/vendor/etc/vintf/manifest.xml

# Service binaries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/system/bin/android.hardware.gatekeeper@1.0-service-qti:recovery/root/system/bin/android.hardware.gatekeeper@1.0-service-qti \
    $(COMMON_PATH)/recovery/root/system/bin/android.hardware.keymaster@4.0-service-qti:recovery/root/system/bin/android.hardware.keymaster@4.0-service-qti \
    $(COMMON_PATH)/recovery/root/system/bin/qseecomd:recovery/root/system/bin/qseecomd

# Service init rc files
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/vendor/etc/init/android.hardware.gatekeeper@1.0-service-qti.rc:recovery/root/vendor/etc/init/android.hardware.gatekeeper@1.0-service-qti.rc \
    $(COMMON_PATH)/recovery/root/vendor/etc/init/android.hardware.keymaster@4.0-service-qti.rc:recovery/root/vendor/etc/init/android.hardware.keymaster@4.0-service-qti.rc \
    $(COMMON_PATH)/recovery/root/vendor/etc/init/qseecomd.rc:recovery/root/vendor/etc/init/qseecomd.rc

# Gatekeeper & Keymaster HALs and libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/system/lib64/android.hardware.gatekeeper@1.0.so:recovery/root/system/lib64/android.hardware.gatekeeper@1.0.so \
    $(COMMON_PATH)/recovery/root/system/lib64/android.hardware.keymaster@4.0.so:recovery/root/system/lib64/android.hardware.keymaster@4.0.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so:recovery/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libkeymasterdeviceutils.so:recovery/root/vendor/lib64/libkeymasterdeviceutils.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libkeymasterprovision.so:recovery/root/vendor/lib64/libkeymasterprovision.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libkeymasterutils.so:recovery/root/vendor/lib64/libkeymasterutils.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libqtikeymaster4.so:recovery/root/vendor/lib64/libqtikeymaster4.so

# QSEECom & Security libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libQSEEComAPI.so:recovery/root/vendor/lib64/libQSEEComAPI.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libGPreqcancel.so:recovery/root/vendor/lib64/libGPreqcancel.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libGPreqcancel_svc.so:recovery/root/vendor/lib64/libGPreqcancel_svc.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libSecureUILib.so:recovery/root/vendor/lib64/libSecureUILib.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libsecureui_svcsock.so:recovery/root/vendor/lib64/libsecureui_svcsock.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/librpmb.so:recovery/root/vendor/lib64/librpmb.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libssd.so:recovery/root/vendor/lib64/libssd.so

# Display & DRM libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libdisplayconfig.qti.so:recovery/root/vendor/lib64/libdisplayconfig.qti.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libdrm.so:recovery/root/vendor/lib64/libdrm.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libdrmfs.so:recovery/root/vendor/lib64/libdrmfs.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libdrmtime.so:recovery/root/vendor/lib64/libdrmtime.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/vendor.display.config@1.0.so:recovery/root/vendor/lib64/vendor.display.config@1.0.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/vendor.display.config@2.0.so:recovery/root/vendor/lib64/vendor.display.config@2.0.so

# ICU & system libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/system/lib64/libandroidicu.so:recovery/root/system/lib64/libandroidicu.so \
    $(COMMON_PATH)/recovery/root/system/lib64/libicui18n.so:recovery/root/system/lib64/libicui18n.so \
    $(COMMON_PATH)/recovery/root/system/lib64/libicuuc.so:recovery/root/system/lib64/libicuuc.so

# Firmware
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/vendor/firmware/aw8695_haptic.bin:recovery/root/vendor/firmware/aw8695_haptic.bin \
    $(COMMON_PATH)/recovery/root/vendor/firmware/aw8695_rtp.bin:recovery/root/vendor/firmware/aw8695_rtp.bin

# Qualcomm vendor libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libops.so:recovery/root/vendor/lib64/libops.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libqcbor.so:recovery/root/vendor/lib64/libqcbor.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libdiag.so:recovery/root/vendor/lib64/libdiag.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libqdutils.so:recovery/root/vendor/lib64/libqdutils.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libqisl.so:recovery/root/vendor/lib64/libqisl.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libqservice.so:recovery/root/vendor/lib64/libqservice.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libStDrvInt.so:recovery/root/vendor/lib64/libStDrvInt.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/librecovery_updater_msm.so:recovery/root/vendor/lib64/librecovery_updater_msm.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/libtime_genoff.so:recovery/root/vendor/lib64/libtime_genoff.so \
    $(COMMON_PATH)/recovery/root/vendor/lib64/vendor.qti.hardware.tui_comm@1.0.so:recovery/root/vendor/lib64/vendor.qti.hardware.tui_comm@1.0.so