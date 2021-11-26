//
//  BaseViewController.h
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/5/13.
//  Copyright © 2021 Yieldzone. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

- (void)showBannerAlert;

- (void)showInterstitialAlert;

- (void)showSplashAlert;

- (void)showNativeAlert;

- (void)showDrawNativeAlert;

- (void)drawAdInit;

@end

NS_ASSUME_NONNULL_END
