//
//  RewardVideoViewController.m
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/4/1.
//  Copyright © 2021 Yieldzone. All rights reserved.
//

#import "RewardVideoViewController.h"
#import <YieldzoneAdSDK/YieldzoneAdRewardVideoAd.h>
#import "Utils.h"

@interface RewardVideoViewController ()<YieldzoneAdRewardVideoAdDelegate>

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, strong) YieldzoneAdRewardVideoAd *rewardVideoAd;

@end

@implementation RewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _statusLabel = [[UILabel alloc]init];
    [_statusLabel setFont:[UIFont systemFontOfSize:16]];
    [_statusLabel setTextColor:[UIColor redColor]];
    [_statusLabel setTextAlignment:NSTextAlignmentCenter];
    _statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _statusLabel.text = @"Tap button to load and show Ad";
    [self.view addSubview:_statusLabel];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_statusLabel]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_statusLabel)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-35-[_statusLabel(25)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_statusLabel)]];
    
    
    UIButton *loadRewardVideoAd = [UIButton buttonWithType:UIButtonTypeSystem];
    loadRewardVideoAd.layer.borderWidth = 0.5;
    loadRewardVideoAd.layer.cornerRadius = 8;
    loadRewardVideoAd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loadRewardVideoAd.translatesAutoresizingMaskIntoConstraints = NO;
    [loadRewardVideoAd addTarget:self action:@selector(loadRewardVideoAd:) forControlEvents:UIControlEventTouchUpInside];
    [loadRewardVideoAd setTitle:@"Load RewardVideo" forState:UIControlStateNormal];
    [loadRewardVideoAd setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:loadRewardVideoAd];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[loadRewardVideoAd]-170-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(loadRewardVideoAd)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statusLabel]-20-[loadRewardVideoAd(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_statusLabel,loadRewardVideoAd)]];
    
    UIButton *showRewardVideoAd = [UIButton buttonWithType:UIButtonTypeSystem];
    showRewardVideoAd.layer.borderWidth = 0.5;
    showRewardVideoAd.layer.cornerRadius = 8;
    showRewardVideoAd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    showRewardVideoAd.translatesAutoresizingMaskIntoConstraints = NO;
    [showRewardVideoAd addTarget:self action:@selector(showRewardVideoAd:) forControlEvents:UIControlEventTouchUpInside];
    [showRewardVideoAd setTitle:@"Show RewardVideo" forState:UIControlStateNormal];
    [showRewardVideoAd setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:showRewardVideoAd];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[showRewardVideoAd]-170-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(showRewardVideoAd)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[loadRewardVideoAd]-20-[showRewardVideoAd(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(loadRewardVideoAd,showRewardVideoAd)]];
}

- (void)loadRewardVideoAd:(id)sender {
    
    self.statusLabel.text = @"Loading......";
    if (self.rewardVideoAd) {
        self.rewardVideoAd.delegate = nil;
    }
    self.rewardVideoAd = [[YieldzoneAdRewardVideoAd alloc]initWithPlacementID:test_reward_pid];
    self.rewardVideoAd.delegate = self;
    [self.rewardVideoAd loadAd];
}

- (void)showRewardVideoAd:(id)sender {
    if (self.rewardVideoAd.isAdValid) {
        [self.rewardVideoAd showAdFromRootViewController:self];
    }
}

#pragma mark----YieldzoneAdRewardVideoAdDelegate

/**
 广告数据加载成功回调

 */
- (void)rewardVideoAdSuccess:(YieldzoneAdRewardVideoAd *)rewardedVideoAd {
    self.statusLabel.text = @"Ad loaded Success";
}


/**
视频广告各种错误信息回调
 
@param error 具体错误信息
*/
- (void)rewardVideoAd:(YieldzoneAdRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    self.statusLabel.text = @"Ad loaded Error";
}

/**
 视频广告视频播放完成
 */
- (void)rewardVideoAdDidPlayFinish:(YieldzoneAdRewardVideoAd *)rewardedVideoAd {
    
}

/**
 视频广告曝光回调

 */
- (void)rewardVideoAdDidExposed:(YieldzoneAdRewardVideoAd *)rewardedVideoAd {
    self.statusLabel.text = @"Ad loaded Exposed";
}

/**
 视频播放页关闭回调

 */
- (void)rewardVideoAdDidClose:(YieldzoneAdRewardVideoAd *)rewardedVideoAd {
    self.statusLabel.text = @"Ad loaded Close";
}

/**
 视频广告播放达到激励条件回调

 */
- (void)rewardVideoAdDidRewardEffective:(YieldzoneAdRewardVideoAd *)rewardedVideoAd {
    
}

/**
 视频广告信息点击回调
 */
- (void)rewardVideoAdDidClicked:(YieldzoneAdRewardVideoAd *)rewardedVideoAd {
    self.statusLabel.text = @"Ad loaded Click";
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
