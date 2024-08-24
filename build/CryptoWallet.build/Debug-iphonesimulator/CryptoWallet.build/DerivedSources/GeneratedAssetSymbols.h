#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"TheHunterCode.CryptoWallet";

/// The "AccentColor" asset catalog color resource.
static NSString * const ACColorNameAccentColor AC_SWIFT_PRIVATE = @"AccentColor";

/// The "BackgroundColor" asset catalog color resource.
static NSString * const ACColorNameBackgroundColor AC_SWIFT_PRIVATE = @"BackgroundColor";

/// The "IndicatorDownColor" asset catalog color resource.
static NSString * const ACColorNameIndicatorDownColor AC_SWIFT_PRIVATE = @"IndicatorDownColor";

/// The "IndicatorUpColor" asset catalog color resource.
static NSString * const ACColorNameIndicatorUpColor AC_SWIFT_PRIVATE = @"IndicatorUpColor";

/// The "PortfolioRowColor" asset catalog color resource.
static NSString * const ACColorNamePortfolioRowColor AC_SWIFT_PRIVATE = @"PortfolioRowColor";

/// The "SecondaryTextColor" asset catalog color resource.
static NSString * const ACColorNameSecondaryTextColor AC_SWIFT_PRIVATE = @"SecondaryTextColor";

/// The "headerBackground" asset catalog color resource.
static NSString * const ACColorNameHeaderBackground AC_SWIFT_PRIVATE = @"headerBackground";

/// The "tabbarBackgroundColor" asset catalog color resource.
static NSString * const ACColorNameTabbarBackgroundColor AC_SWIFT_PRIVATE = @"tabbarBackgroundColor";

/// The "tabbarUnselectedColor" asset catalog color resource.
static NSString * const ACColorNameTabbarUnselectedColor AC_SWIFT_PRIVATE = @"tabbarUnselectedColor";

/// The "downIndicator" asset catalog image resource.
static NSString * const ACImageNameDownIndicator AC_SWIFT_PRIVATE = @"downIndicator";

/// The "headerLogo" asset catalog image resource.
static NSString * const ACImageNameHeaderLogo AC_SWIFT_PRIVATE = @"headerLogo";

/// The "iconPlaceholder" asset catalog image resource.
static NSString * const ACImageNameIconPlaceholder AC_SWIFT_PRIVATE = @"iconPlaceholder";

/// The "upIndicator" asset catalog image resource.
static NSString * const ACImageNameUpIndicator AC_SWIFT_PRIVATE = @"upIndicator";

#undef AC_SWIFT_PRIVATE
