//
//  BannerAdViewController.m
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/2/2.
//  Copyright © 2021 Yieldzone. All rights reserved.
//

#import "BannerAdViewController.h"
#import <YieldzoneAdSDK/YieldzoneAdBannerAdView.h>
#import "Utils.h"
#import "BaseViewController.h"


@interface BannerAdViewController ()<YieldzoneAdBannerAdDelegate>

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic ,strong) YieldzoneAdBannerAdView *adView;

@end

@implementation BannerAdViewController

///demo测试数据
#pragma mark ---广告资源切换

- (void)adMediaCheck:(id)sender {
    [self showBannerAlert];
}


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
    
    
    UIButton *load320x50Ad = [UIButton buttonWithType:UIButtonTypeSystem];
    load320x50Ad.layer.borderWidth = 0.5;
    load320x50Ad.layer.cornerRadius = 8;
    load320x50Ad.layer.borderColor = [UIColor lightGrayColor].CGColor;
    load320x50Ad.translatesAutoresizingMaskIntoConstraints = NO;
    [load320x50Ad addTarget:self action:@selector(load320x50Ad:) forControlEvents:UIControlEventTouchUpInside];
    [load320x50Ad setTitle:@"Load 320X50 Banner" forState:UIControlStateNormal];
    [load320x50Ad setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:load320x50Ad];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[load320x50Ad]-170-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(load320x50Ad)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statusLabel]-20-[load320x50Ad(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_statusLabel,load320x50Ad)]];

    
    UIButton *load320x100Ad = [UIButton buttonWithType:UIButtonTypeSystem];
    load320x100Ad.layer.borderWidth = 0.5;
    load320x100Ad.layer.cornerRadius = 8;
    load320x100Ad.layer.borderColor = [UIColor lightGrayColor].CGColor;
    load320x100Ad.translatesAutoresizingMaskIntoConstraints = NO;
    [load320x100Ad addTarget:self action:@selector(load320x100Ad:) forControlEvents:UIControlEventTouchUpInside];
    [load320x100Ad setTitle:@"Load 320X100 Banner" forState:UIControlStateNormal];
    [load320x100Ad setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:load320x100Ad];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[load320x100Ad]-170-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(load320x100Ad)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[load320x50Ad]-20-[load320x100Ad(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(load320x50Ad,load320x100Ad)]];
    
    UIButton *load320x90Ad = [UIButton buttonWithType:UIButtonTypeSystem];
    load320x90Ad.layer.borderWidth = 0.5;
    load320x90Ad.layer.cornerRadius = 8;
    load320x90Ad.layer.borderColor = [UIColor lightGrayColor].CGColor;
    load320x90Ad.translatesAutoresizingMaskIntoConstraints = NO;
    [load320x90Ad addTarget:self action:@selector(load320x90Ad:) forControlEvents:UIControlEventTouchUpInside];
    [load320x90Ad setTitle:@"Load 320X90 Banner" forState:UIControlStateNormal];
    [load320x90Ad setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:load320x90Ad];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[load320x90Ad]-170-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(load320x90Ad)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[load320x100Ad]-20-[load320x90Ad(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(load320x100Ad,load320x90Ad)]];
    
    UIButton *load300x250Ad = [UIButton buttonWithType:UIButtonTypeSystem];
    load300x250Ad.layer.borderWidth = 0.5;
    load300x250Ad.layer.cornerRadius = 8;
    load300x250Ad.layer.borderColor = [UIColor lightGrayColor].CGColor;
    load300x250Ad.translatesAutoresizingMaskIntoConstraints = NO;
    [load300x250Ad addTarget:self action:@selector(load300x250Ad:) forControlEvents:UIControlEventTouchUpInside];
    [load300x250Ad setTitle:@"Load 300X250 Banner" forState:UIControlStateNormal];
    [load300x250Ad setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:load300x250Ad];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[load300x250Ad]-170-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(load300x250Ad)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[load320x90Ad]-20-[load300x250Ad(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(load320x90Ad,load300x250Ad)]];
    
    UIButton *loadFitAd = [UIButton buttonWithType:UIButtonTypeSystem];
    loadFitAd.layer.borderWidth = 0.5;
    loadFitAd.layer.cornerRadius = 8;
    loadFitAd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loadFitAd.translatesAutoresizingMaskIntoConstraints = NO;
    [loadFitAd addTarget:self action:@selector(loadFitAd:) forControlEvents:UIControlEventTouchUpInside];
    [loadFitAd setTitle:@"Load Fit Banner" forState:UIControlStateNormal];
    [loadFitAd setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:loadFitAd];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[loadFitAd]-170-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(loadFitAd)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[load300x250Ad]-20-[loadFitAd(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(load300x250Ad,loadFitAd)]];
}

//@"YOUR_PLACEMENT_ID"  ca-app-pub-3940256099942544/2934735716

- (void)showBannerWithAdSize:(SXAdSize)size rect:(CGRect)rect{
    /***remove banner*/
    if (self.adView) {
        [self.adView removeFromSuperview];
        self.adView = nil;
    }
    
    self.adView = [[YieldzoneAdBannerAdView alloc]initWithPlacementID:test_banner_pid adSize:size rootViewController:self];
    self.adView.delegate = self;
    self.adView.frame = rect;
    [self.view addSubview:self.adView];
    
    [self.adView loadAdAndShow];
    self.statusLabel.text = @"Loading......";
}

- (void)load320x50Ad:(UIButton *)sender {
    
    CGRect rect = {CGPointMake(0, 400), CGSizeMake(320, 50)};
    [self showBannerWithAdSize:kSXAdSize320x50 rect:rect];
    
}

- (void)load320x100Ad:(UIButton *)sender {
    CGRect rect = {CGPointMake(0, 400), CGSizeMake(320, 100)};
    [self showBannerWithAdSize:kSXAdSize320x100 rect:rect];
}

- (void)load320x90Ad:(UIButton *)sender {
    CGRect rect = {CGPointMake(0, 400), CGSizeMake(320, 90)};
    [self showBannerWithAdSize:kSXAdSize320x90 rect:rect];
}

- (void)load300x250Ad:(UIButton *)sender {
    CGRect rect = {CGPointMake(0, 400), CGSizeMake(300, 250)};
    [self showBannerWithAdSize:kSXAdSize300x250 rect:rect];
}

- (void)loadFitAd:(UIButton *)sender {
    NSLog(@"w----:%f",self.view.frame.size.width);
    CGRect rect = {CGPointMake(0, 400), CGSizeMake(self.view.frame.size.width, 100)};
    [self showBannerWithAdSize:SXAdSizeFromCGSize(CGSizeMake(self.view.frame.size.width, 100)) rect:rect];
}

#pragma mark----YieldzoneAdBannerAdDelegate---

/**
 *
 */
- (void)bannerViewDidLoad:(YieldzoneAdBannerAdView *)bannerView {
    self.statusLabel.text = @"Ad loaded";
}

/**

 */
- (void)bannerViewFailedToLoad:(YieldzoneAdBannerAdView *)bannerView error:(NSError *)error{
    self.statusLabel.text = @"Ad loaded fail";
}

/**
 *
 */
- (void)bannerViewWillExpose:(YieldzoneAdBannerAdView *)bannerView {
    self.statusLabel.text = @"Ad Expose";
}

/**
 *
 */
- (void)bannerViewClicked:(YieldzoneAdBannerAdView *)bannerView {
    self.statusLabel.text = @"Ad Click";
}

/**
 *
 */
- (void)bannerViewDidPresentFullScreenModal:(YieldzoneAdBannerAdView *)bannerView {
    
}

/**
 *
 */
- (void)bannerViewDidDismissFullScreenModal:(YieldzoneAdBannerAdView *)bannerView {
    
}

- (void)dealloc {
    NSLog(@"bannerAdViewController----dealloc");
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
