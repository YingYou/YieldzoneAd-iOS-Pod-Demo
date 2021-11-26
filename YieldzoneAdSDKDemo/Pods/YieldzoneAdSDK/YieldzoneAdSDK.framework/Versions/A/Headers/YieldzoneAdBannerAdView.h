//
//  YieldzoneAdBannerAdView.h
//  YieldzoneAdSDK
//
//  Created by Wei yang on 2021/2/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YieldzoneSXAdConst.h"

NS_ASSUME_NONNULL_BEGIN

@class YieldzoneAdBannerAdView;


@protocol YieldzoneAdBannerAdDelegate <NSObject>

@optional
/**
 *
 Called after requesting advertisement banner data successfully
  * This function is called when the advertisement data returned by the receiving server is successful
 */
- (void)bannerViewDidLoad:(YieldzoneAdBannerAdView *)bannerView;

/**
 *
 Called after requesting advertisement banner data failed
  * This function is called when the advertisement data returned by the receiving server fails
 */
- (void)bannerViewFailedToLoad:(YieldzoneAdBannerAdView *)bannerView error:(NSError *)error;

/**
 *
 Exposure
 */
- (void)bannerViewWillExpose:(YieldzoneAdBannerAdView *)bannerView;

/**
 * Click
 */
- (void)bannerViewClicked:(YieldzoneAdBannerAdView *)bannerView;

///**
// *
// After the ad is clicked, the full-screen ad page will pop up.
// */
//- (void)bannerViewDidPresentFullScreenModal:(YieldzoneAdBannerAdView *)bannerView;
//
///**
// *  ad page has been closed
// */
//- (void)bannerViewDidDismissFullScreenModal:(YieldzoneAdBannerAdView *)bannerView;

@end


@interface YieldzoneAdBannerAdView : UIView

@property (nonatomic, weak) id <YieldzoneAdBannerAdDelegate> delegate;

@property (nonatomic ,assign) SXAdSize adSize;

- (instancetype)initWithPlacementID:(NSString *)placementID
                             adSize:(SXAdSize)adSize
                 rootViewController:(nullable UIViewController *)rootViewController ;

/**
 *  Pull and display ads
 *
 */
- (void)loadAdAndShow;



@end

NS_ASSUME_NONNULL_END
