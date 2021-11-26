//
//  SparkXAdNativeExpressAdManager.h
//  YieldzoneAdSDK
//
//  Created by Wei yang on 2021/2/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YieldzoneNativeExpressAdView.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    YieldzoneNativeExpressLeftMediaRightText = 0,
    YieldzoneNativeExpressTopMediaBottomText = 1,
    YieldzoneNativeExpressTopTextBottomMedia = 2,
    YieldzoneNativeExpressRightMediaLeftText = 3,
    YieldzoneNativeExpressThreePicText       = 4,
    
    YieldzoneNativeExpressDrawVideo          = 100
} YieldzoneNativeExpressType;

/**
 *  视频播放器状态
 *
 *  播放器只可能处于以下状态中的一种
 *
 */
typedef NS_ENUM(NSUInteger, YieldzoneMediaPlayerStatus) {
    
    YieldzonePlayerPlayStateUnknown,
    YieldzonePlayerPlayStatePlaying,
    YieldzonePlayerPlayStatePaused,
    YieldzonePlayerPlayStatePlayFailed,
    YieldzonePlayerPlayStatePlayStopped
};

@class YieldzoneNativeExpressAd;


@protocol YieldzoneAdNativeExpressAdDelegate <NSObject>

@optional
/**
 *
 Succeeded in pulling native template ads
 */
- (void)nativeExpressAdSuccessToLoad:(YieldzoneNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof YieldzoneNativeExpressAdView *> *)views;


/**
 *
 Failed to pull native template ads
 */
- (void)nativeExpressAdFailToLoad:(YieldzoneNativeExpressAd *)nativeExpressAd error:(NSError *)error;


/**
 *
 The native template advertisement is rendered successfully, and the nativeExpressAdView.size.height is dynamically updated according to the size.width at this time.
 */
- (void)nativeExpressAdViewRenderSuccess:(YieldzoneNativeExpressAdView *)nativeExpressAdView;

/**
 * Native template ad rendering failed
 */
- (void)nativeExpressAdViewRenderFail:(YieldzoneNativeExpressAdView *)nativeExpressAdView;


/**
 * Native template ad exposure
 */
- (void)nativeExpressAdViewExposure:(YieldzoneNativeExpressAdView *)nativeExpressAdView;


///click
- (void)nativeExpressAdViewClicked:(YieldzoneNativeExpressAdView *)nativeExpressAdView;

/**
 * Native template ads are closed
 */
- (void)nativeExpressAdViewClosed:(YieldzoneNativeExpressAdView *)nativeExpressAdView;

- (void)nativeExpressAdWillLeaveApplication:(YieldzoneNativeExpressAdView *)nativeExpressAdView;

/**
 *
 Native template video ad player playback status update callback
 */
- (void)nativeExpressAdView:(YieldzoneNativeExpressAdView *)nativeExpressAdView playerStatusChanged:(YieldzoneMediaPlayerStatus)status;

/**
 * Sent when a player finished
 * @param error : error of player
 */
- (void)nativeExpressAdViewPlayerDidPlayFinish:(YieldzoneNativeExpressAdView *)nativeExpressAdView error:(NSError *)error;

@end


@interface YieldzoneNativeExpressAd : NSObject

@property (nonatomic, weak) id <YieldzoneAdNativeExpressAdDelegate> delegate;

@property (nonatomic ,assign) YieldzoneNativeExpressType nativeAdType;

@property (nonatomic ,assign) CGSize adSize;


/**
 *
 *  des：placementId - ad ID
 *       adSize - The width and height of the ad display
 */

- (instancetype)initWithPlacementId:(NSString *)placementId adSize:(CGSize)size;

- (void)loadAd;

@end

NS_ASSUME_NONNULL_END
