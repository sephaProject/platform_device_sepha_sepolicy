#
# This policy configuration will be used by select legacy products that
# inherit from sepha
#

ifeq ($(TARGET_HAS_LEGACY_CAMERA_HAL1), true)
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/sepha/sepolicy/legacy-common/public/legacy-camera-hal1
endif
