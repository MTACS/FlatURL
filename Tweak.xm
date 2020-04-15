#import <UIKit/UIKit.h>

// Interface declarations

@interface _SFNavigationBarURLButton : UIButton
@end

@interface _SFNavigationBar : UIView {

	UILabel* _URLLabel;

}
@end

@interface UIUserInterfaceStyleArbiter : NSObject { // Dark/Light mode arbiter

	long long _currentStyle;

}
+ (id)sharedInstance;
- (long long)currentStyle;
@end

%hook _SFNavigationBarURLButton // URL Bar

- (void)setBackgroundAlphaFactor:(double)arg1 { // Set the alpha, background color or hidden doesn't seem to work

	%orig(0.0);

}

%end

%hook _SFNavigationBar // To set text color when in light mode

- (void)layoutSubviews {

	%orig;

	UILabel *urlLabel = MSHookIvar<UILabel *>(self, "_URLLabel");

	UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");

	if (self.traitCollection.userInterfaceStyle != UIUserInterfaceStyleDark) { // Check for light mode

		urlLabel.textColor = [UIColor blackColor]; // Set text color

		textField.textColor = [UIColor blackColor];

		UILabel *privateBrowsingLabel = MSHookIvar<UILabel *>(self, "_privateBrowsingLabel");

		privateBrowsingLabel.textColor = [UIColor blackColor]; // Set for private browsing mode

	}

}

%end
