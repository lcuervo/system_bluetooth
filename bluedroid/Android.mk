#
# libbluedroid
#

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(TARGET_CUSTOM_BLUEDROID),)
	LOCAL_SRC_FILES := \
		bluetooth.c
else
	LOCAL_SRC_FILES := \
		$(TARGET_CUSTOM_BLUEDROID)
endif

ifeq ($(SW_BOARD_HAVE_BLUETOOTH_CSR),true)
LOCAL_CFLAGS:= -DBOARD_HAVE_BLUETOOTH_CSR
endif

# realtek rtl8723as combo bt
ifeq ($(SW_BOARD_HAVE_BLUETOOTH_RTK), true)
LOCAL_CFLAGS += -DSW_BOARD_HAVE_BLUETOOTH_RTK
endif

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	system/bluetooth/bluez-clean-headers

LOCAL_SHARED_LIBRARIES := \
	libcutils

LOCAL_MODULE := libbluedroid

include $(BUILD_SHARED_LIBRARY)
