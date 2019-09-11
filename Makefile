INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_DEVICE_IP = 192.168.1.182

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = borders

borders_FILES = Tweak.x
borders_CFLAGS = -fobjc-arc
borders_FRAMEWORKS = UIKit 
borders_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += bordersprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
