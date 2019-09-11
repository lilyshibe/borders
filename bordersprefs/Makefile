include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = bordersprefs

bordersprefs_FILES = BRDRootListController.m
bordersprefs_INSTALL_PATH = /Library/PreferenceBundles
bordersprefs_FRAMEWORKS = UIKit
bordersprefs_PRIVATE_FRAMEWORKS = Preferences
bordersprefs_CFLAGS = -fobjc-arc
bordersprefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/bordersprefs.plist$(ECHO_END)
