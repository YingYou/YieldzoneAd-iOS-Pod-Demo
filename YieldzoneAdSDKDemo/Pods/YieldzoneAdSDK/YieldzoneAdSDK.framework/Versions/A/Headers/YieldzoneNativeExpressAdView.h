//
//  YieldzoneNativeExpressAdView.h
//  YieldzoneAdSDK
//
//  Created by Wei yang on 2021/2/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YieldzoneNativeExpressAdView : UIView


@property (nonatomic ,readonly) CGPoint startLocation ;
@property (nonatomic ,readonly) CGPoint endLocation ;


/*
 *  viewControllerForPresentingModalView
 *
 Detailed explanation: [Required] The developer needs to pass in the ViewController used to pop up the target page, usually the current ViewController
 */
@property (nonatomic, weak) UIViewController *controller;

/**
 *[required]
 *Native template ad rendering
 */
- (void)render;

///Close ad player
- (void)adClosePlayer;


@end

NS_ASSUME_NONNULL_END
