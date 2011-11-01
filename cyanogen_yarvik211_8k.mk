# Inherit AOSP device configuration for TCC8902RT.
$(call inherit-product, device/telechips/tcc8902rt/full_tcc8902rt.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Include extra dictionaries for LatinIME
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/dictionaries

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_yarvik211_8k
PRODUCT_BRAND := telechips
PRODUCT_DEVICE := tcc8902rt
PRODUCT_MODEL := TAB211 8K
PRODUCT_MANUFACTURER := Yarvik
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=yarvik211_8k BUILD_ID=GRK39F BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/soju/crespo:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.6 GRK39F 189904 release-keys" BUILD_NUMBER=189904

# Extra TCC8902RT overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/telechips/tcc8902rt/overlay

# Accelerometer hacks
PRODUCT_PROPERTY_OVERRIDES += \
    accelerometer.flip_xy=1 \
    accelerometer.invert_x=1

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-TCC8902RT
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-TCC8902RT
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-TCC8902RT-KANG
    endif
endif

#
# Copy TCC8902RT specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
