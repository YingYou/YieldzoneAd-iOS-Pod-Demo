//
//  YieldzoneAdRewardVideoAdManager.h
//  YieldzoneAdSDK
//
//  Created by Wei yang on 2021/2/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YieldzoneAdRewardVideoAd;

@protocol YieldzoneAdRewardVideoAdDelegate <NSObject>

@optional

/**
 
 Advertisement data loaded successfully callback

 */
- (void)rewardVideoAdSuccess:(YieldzoneAdRewardVideoAd *)rewardedVideoAd;


/**

 Video ad various error message callback
 
@param error Specific error message
*/
- (void)rewardVideoAd:(YieldzoneAdRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error;

/**
 
 Video ad video playback completed
 */
- (void)rewardVideoAdDidPlayFinish:(YieldzoneAdRewardVideoAd *)rewardedVideoAd;

/**
 
 Video ad exposure callback

 */
- (void)rewardVideoAdDidExposed:(YieldzoneAdRewardVideoAd *)rewardedVideoAd;

/**
 
 Video playback page closed callback

 */
- (void)rewardVideoAdDidClose:(YieldzoneAdRewardVideoAd *)rewardedVideoAd;

/**
 Video ad playback reaches the incentive condition callback

 */
- (void)rewardVideoAdDidRewardEffective:(YieldzoneAdRewardVideoAd *)rewardedVideoAd;

/**
 Video advertisement information click callback
 */
- (void)rewardVideoAdDidClicked:(YieldzoneAdRewardVideoAd *)rewardedVideoAd;


@end

@interface YieldzoneAdRewardVideoAd : NSObject

@property (nonatomic, weak) id <YieldzoneAdRewardVideoAdDelegate> delegate;
/*
You should check `isAdValid` before trying to show the ad.
*/
@property (nonatomic, getter=isAdValid, readonly) BOOL adValid;


- (instancetype)initWithPlacementID:(NSString *)placementID;

- (void)loadAd;

/**
 Display video ad.
 Presents the ad. Must be called on the main thread.
 @param rootViewController : root view controller for displaying ad.
  @param adUnitId  ad adUnitId
 */
- (void)showAdFromRootViewController:(UIViewController *)rootViewController;


@end

NS_ASSUME_NONNULL_END
