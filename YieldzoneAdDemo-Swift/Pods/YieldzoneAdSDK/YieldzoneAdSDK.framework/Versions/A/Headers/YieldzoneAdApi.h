//
//  YieldzoneAdApi.h
//  YieldzoneAdSDK
//
//  Created by Wei yang on 2021/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YieldzoneConsentStatus) {
    YieldzoneConsentStatusUnknown,
    YieldzoneConsentStatusDenied,
    YieldzoneConsentStatusConsented,
};

@interface YieldzoneAdApi : NSObject

///init Yieldzone Ad SDK
+ (void)initWithYieldzoneAd:(NSString  *)appId completion:(void (^)(NSError *error))completion;

/// setUserConsent "NO" is Refuse，"YES" is Accepted. //GDPR
/// According to the GDPR, set method of this property must be called before "initWithYieldzoneAd:", or by default will collect user's information.
+ (void)setGDPRConsent:(BOOL)consent;

/// Get the GDPR current consent status of this user.
+ (YieldzoneConsentStatus)currentConsentStatus;

///According to the CCPA, set method of this property must be called before "initWithYieldzoneAd:", or by default will collect user's information.
+ (void)setUSPrivacyLimit:(BOOL)privacyLimit;

///Returns the version of the SDK
+ (NSString *)sdkVersion;

/**
 User's consent for advertiser tracking.

 The setter API only works in iOS14 or above and won't take effect in iOS13 or below.
 */
+ (void)setAdvertiserTrackingEnabled:(BOOL)advertiserTrackingEnabled;

///Adds a test ad
+ (void)addTest:(BOOL)test;

+(void) setLogEnabled:(BOOL)logEnabled;

@end

NS_ASSUME_NONNULL_END
