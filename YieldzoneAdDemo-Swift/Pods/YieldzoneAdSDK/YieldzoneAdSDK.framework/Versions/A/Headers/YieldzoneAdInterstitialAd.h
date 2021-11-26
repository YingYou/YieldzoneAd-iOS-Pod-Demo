//
//  YieldzoneAdInterstitialAd.h
//  YieldzoneAdSDK
//
//  Created by Wei yang on 2021/2/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YieldzoneSXAdConst.h"

NS_ASSUME_NONNULL_BEGIN

@class YieldzoneAdInterstitialAd;

@protocol YieldzoneAdInterstitialAdDelegate <NSObject>

@optional

/// Tells the delegate an ad request succeeded.
- (void)interstitialDidReceiveAd:(YieldzoneAdInterstitialAd *)interstitialAd;

/// Tells the delegate an ad request failed.
- (void)didFailToReceiveAdWithError:(YieldzoneAdInterstitialAd *)interstitialAd error:(NSError *)error;

/// Tells the delegate that an interstitial did Exposed.
- (void)interstitialAdDidExposed:(YieldzoneAdInterstitialAd *)interstitialAd;

- (void)interstitialAdDidClose:(YieldzoneAdInterstitialAd *)interstitialAd;

- (void)interstitialAdDidClick:(YieldzoneAdInterstitialAd *)interstitialAd;

@end

@interface YieldzoneAdInterstitialAd : NSObject

@property (nonatomic, weak) id <YieldzoneAdInterstitialAdDelegate> delegate;

/**
  Returns true if the interstitial ad has been successfully loaded.


 You should check `isAdValid` before trying to show the ad.
 */
@property (nonatomic, getter=isAdValid, readonly) BOOL adValid;

- (instancetype)initWithPlacementID:(NSString *)placementID adSize:(SXAdSize)adSize;

/**
 * [Required] Initiate a request to pull ads
 */
- (void)loadAd;


/**
 * [Required] To initiate a display ad request, you must pass in the UIViewController used to display the interstitial ad
 * Presents the ad. Must be called on the main thread.
 */

- (void)presentAdFromRootViewController:(UIViewController *)rootViewController;

@end

NS_ASSUME_NONNULL_END
