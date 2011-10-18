$(call inherit-product, $(SRC_TARGET_DIR)/product/small_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/telechips/tcc8902rt/device-vendor.mk)

$(call inherit-product, device/telechips/common/common.mk)

DEVICE_PACKAGE_OVERLAYS += device/telechips/tcc8902rt/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/telechips/tcc8902rt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/telechips/tcc8902rt/init.rc:root/init.rc

PRODUCT_COPY_FILES += \
    device/telechips/tcc8902rt/etc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.use_dithering=0 \
    persist.sys.use_16bpp_alpha=1

PRODUCT_NAME := full_tcc8902rt
PRODUCT_DEVICE := tcc8902rt
