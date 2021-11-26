//
//  AppDelegate.m
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/2/2.
//

#import "AppDelegate.h"
#import "AdListViewController.h"
#import <YieldzoneAdSDK/YieldzoneAdSplashAd.h>
#import <YieldzoneAdSDK/YieldzoneAdApi.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import "Utils.h"


@interface AppDelegate ()<YieldzoneAdSplashAdDelegate>

@property (nonatomic ,strong) YieldzoneAdSplashAd * splashAd;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"Yieldzone SDK--YieldzoneAdApi init----start---");
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            [YieldzoneAdApi initWithYieldzoneAd:test_app_id completion:^(NSError * _Nonnull error) {
                NSLog(@"Yieldzone SDK--YieldzoneAdApi init----error:%@",error);
            }];
                   //to do something，like preloading
        }];
    } else {
        // Fallback on earlier versions
        [YieldzoneAdApi initWithYieldzoneAd:test_app_id  completion:^(NSError * _Nonnull error) {
            NSLog(@"Yieldzone SDK---YieldzoneAdApi init----error:%@",error);
        }];
               //to do something，like preloading
    }
    [YieldzoneAdApi setLogEnabled:YES];
    [YieldzoneAdApi setAdvertiserTrackingEnabled:YES];
    //----测试facebook广告
    [YieldzoneAdApi addTest:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    
    AdListViewController *adListVC = [[AdListViewController alloc] init];
    UINavigationController *na = [[UINavigationController alloc] initWithRootViewController:adListVC];
    self.window.rootViewController = na;
    [self.window makeKeyAndVisible];
    
    //确保上面的YieldzoneAdApi 初始化成功之后调用广告相关api！！！！！
    self.splashAd = [[YieldzoneAdSplashAd alloc]initWithPlacementId:test_splash_pid];
    self.splashAd.delegate = self;
    [self.splashAd showAdFromRootViewController:self.window.rootViewController withBottomView:nil];
    
    return YES;
}

#pragma mark----YieldzoneAdSplashAdDelegate

/**
 *  开屏广告成功展示
 */
- (void)splashAdSuccessPresentScreen:(YieldzoneAdSplashAd *)splashAd {
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  开屏广告素材加载成功
 */
- (void)splashAdDidLoad:(YieldzoneAdSplashAd *)splashAd {
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  开屏广告展示失败
 */
- (void)splashAdFailToPresent:(YieldzoneAdSplashAd *)splashAd withError:(NSError *)error {
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  开屏广告曝光回调
 */
- (void)splashAdExposured:(YieldzoneAdSplashAd *)splashAd {
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  开屏广告点击回调
 */
- (void)splashAdClicked:(YieldzoneAdSplashAd *)splashAd {
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  开屏广告将要关闭回调
 */
- (void)splashAdClosed:(YieldzoneAdSplashAd *)splashAd {
    NSLog(@"%s", __FUNCTION__);
}


/**
 *  开屏广告点击以后弹出全屏广告页
 */
- (void)splashAdDidPresentFullScreenModal:(YieldzoneAdSplashAd *)splashAd {
    NSLog(@"%s", __FUNCTION__);
}


/**
 *  点击以后全屏广告页已经关闭
 */
- (void)splashAdDidDismissFullScreenModal:(YieldzoneAdSplashAd *)splashAd {
    NSLog(@"%s", __FUNCTION__);
}



@end
