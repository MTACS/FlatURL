THEOS_DEVICE_IP = 10.0.0.151

TARGET = iphone:clang:13.0:13.0

ARCHS = arm64 arm64e

DEBUG = 0

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FlatURL

FlatURL_FILES = Tweak.xm
FlatURL_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
