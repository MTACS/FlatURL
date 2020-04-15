#import <UIKit/UIKit.h>

@interface _SFNavigationBarURLButton : UIButton
@end

@interface _SFNavigationBar : UIView {

	UILabel* _URLLabel;

}
@end

@interface UIUserInterfaceStyleArbiter : NSObject {

	long long _currentStyle;

}
+ (id)sharedInstance;
- (long long)currentStyle;
@end

%hook _SFNavigationBarURLButton

- (void)setBackgroundAlphaFactor:(double)arg1 {

	%orig(0.0);

}

%end

%hook _SFNavigationBar

- (void)layoutSubviews {

	%orig;

	UILabel *urlLabel = MSHookIvar<UILabel *>(self, "_URLLabel");

	UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");

	if (self.traitCollection.userInterfaceStyle != UIUserInterfaceStyleDark) {

		urlLabel.textColor = [UIColor blackColor];

		textField.textColor = [UIColor blackColor];

		UILabel *privateBrowsingLabel = MSHookIvar<UILabel *>(self, "_privateBrowsingLabel");

		privateBrowsingLabel.textColor = [UIColor blackColor];

	}

}

%end
