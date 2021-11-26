//
//  YieldzoneAdSplashAd.h
//  YieldzoneAdSDK
//
//  Created by Wei yang on 2021/2/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class YieldzoneAdSplashAd;

NS_ASSUME_NONNULL_BEGIN


@protocol YieldzoneAdSplashAdDelegate <NSObject>

@optional
/**
 *   ad was successfully displayed
 */
- (void)splashAdSuccessPresentScreen:(YieldzoneAdSplashAd * __nullable)splashAd;

/**
 *  creative loaded successfully
 */
- (void)splashAdDidLoad:(YieldzoneAdSplashAd * __nullable)splashAd;

/**
 *
 Failed to display on-screen ad
 */
- (void)splashAdFailToPresent:(YieldzoneAdSplashAd * __nullable)splashAd withError:(NSError *)error;

/**
 *  advertising exposure callback
 */
- (void)splashAdExposured:(YieldzoneAdSplashAd * __nullable)splashAd;

/**
 *  ad click
 */
- (void)splashAdClicked:(YieldzoneAdSplashAd * __nullable)splashAd;

/**
 *  ad will be closed
 */
- (void)splashAdClosed:(YieldzoneAdSplashAd * __nullable)splashAd;


/**
 *  ads will pop up a full-screen ad page after clicking
 */
- (void)splashAdDidPresentFullScreenModal:(YieldzoneAdSplashAd * __nullable)splashAd;


/**
 *  ad page has been closed
 */
- (void)splashAdDidDismissFullScreenModal:(YieldzoneAdSplashAd * __nullable)splashAd;


@end

@interface YieldzoneAdSplashAd : NSObject

@property (nonatomic, weak) id <YieldzoneAdSplashAdDelegate> delegate;

//+ (instancetype) instance;

/**
 *
 *  des：placementId - ad ID
 */
- (instancetype)initWithPlacementId:(NSString *)placementId;

/**
 Display Splash ad.
 Presents the ad. Must be called on the main thread.
 @param rootViewController : root viewcontroller.
 */

- (void)showAdFromRootViewController:(UIViewController *)rootViewController;

/**
Display Splash ad.
 Presents the ad. Must be called on the main thread.
@param rootViewController : root viewcontroller.
 
 @param bottomView :Logo customization at the bottom
*/
- (void)showAdFromRootViewController:(UIViewController *)rootViewController withBottomView:(nullable UIView *)bottomView;

/**
 * Returns whether the ad can be displayed
 *For parallel requests, judge before calling showAdFromRootViewController
 * @return When the advertisement has been loaded and has not been exposed, it is YES, otherwise it is NO
 */
- (BOOL)isAdValid;

@end

NS_ASSUME_NONNULL_END
