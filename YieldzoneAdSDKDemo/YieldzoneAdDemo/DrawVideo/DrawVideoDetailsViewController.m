//
//  DrawVideoDetailsViewController.m
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/4/20.
//  Copyright © 2021 Yieldzone. All rights reserved.
//

#import "DrawVideoDetailsViewController.h"
#import <YieldzoneAdSDK/YieldzoneNativeExpressAd.h>
#import "Utils.h"

@interface DrawVideoDetailsViewController ()<YieldzoneAdNativeExpressAdDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) YieldzoneNativeExpressAd *nativeAd;

@property (nonatomic ,strong) UIButton *closeButton;

@end

@implementation DrawVideoDetailsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blackColor;
//    self.navigationController.navigationBarHidden = YES;
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage imageNamed:@"draw_back"] forState:UIControlStateNormal];
    [self.view addSubview:closeButton];
    [closeButton addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
    closeButton.frame = CGRectMake(15, 60, 25, 25);
    self.closeButton = closeButton;
    
    self.nativeAd = [[YieldzoneNativeExpressAd alloc]initWithPlacementId:test_native_pid adSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    self.nativeAd.delegate = self;
    self.nativeAd.nativeAdType = YieldzoneNativeExpressDrawVideo;
    [self.nativeAd loadAd];
}

-  (void)closeClick:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//    self.navigationController.navigationBarHidden = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark----delegate
/**
 *
 */
- (void)nativeExpressAdSuccessToLoad:(YieldzoneNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof YieldzoneNativeExpressAdView *> *)views {
//    self.statusLabel.text = @"Ad loaded Success";
    YieldzoneNativeExpressAdView *view = views.firstObject;
    view.controller = self;
    [view render];
    [self.view addSubview:view];
    view.frame = self.view.bounds;
    
    [self.view bringSubviewToFront:self.closeButton];
    
}

- (void)nativeExpressAdViewPlayerDidPlayFinish:(YieldzoneNativeExpressAdView *)nativeExpressAdView error:(NSError *)error {
    NSLog(@"nativeExpressAdViewPlayerDidPlayFinish---:%@",error);
}

- (void)nativeExpressAdView:(YieldzoneNativeExpressAdView *)nativeExpressAdView playerStatusChanged:(YieldzoneMediaPlayerStatus)status {
    NSLog(@"playerStatusChanged-----:%ld",status);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
