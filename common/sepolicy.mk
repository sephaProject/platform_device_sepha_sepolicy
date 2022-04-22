#
# This policy configuration will be used by all products that
# inherit from sepha
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/sepha/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/sepha/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/sepha/sepolicy/common/dynamic \
    device/sepha/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/sepha/sepolicy/common/dynamic \
    device/sepha/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/sepha/sepolicy/legacy-common/sepolicy.mk

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/sepha/sepolicy/atv/sepolicy.mk
endif
