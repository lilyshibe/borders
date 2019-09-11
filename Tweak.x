#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>

static bool enabled = true;
static int prefsCornerRadius = 10;

@interface _UIRootWindow : UIView
	@property (setter=_setContinuousCornerRadius:, nonatomic) double _continuousCornerRadius;
	- (double)_continuousCornerRadius;
	- (void)_setContinuousCornerRadius:(double)arg1;
@end

%hook _UIRootWindow
	- (void)layoutSubviews {
		%orig;
		if (enabled) {
			self._continuousCornerRadius = prefsCornerRadius;
			self.clipsToBounds = YES;
		}
		return;
	}
%end

void reloadPrefs() {
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"toys.lily.borderprefs"];

	enabled = [([file objectForKey:@"enabled"] ?: @(YES)) boolValue];
	// prefsCornerRadius = [([file objectForKey:@"borderradius"] ? : @(10)) intValue];
}

%ctor {
	reloadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("toys.lily.borderprefs/ReloadPrefs"), NULL, kNilOptions);
}