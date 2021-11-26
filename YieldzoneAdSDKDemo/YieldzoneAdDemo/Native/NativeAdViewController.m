//
//  NativeAdViewController.m
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/2/4.
//  Copyright © 2021 Yieldzone. All rights reserved.
//

#import "NativeAdViewController.h"
#import <YieldzoneAdSDK/YieldzoneNativeExpressAd.h>
#import "Utils.h"

@interface NativeAdViewController ()<YieldzoneAdNativeExpressAdDelegate>

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, strong) UIButton *loadNativeAd;
@property (nonatomic, strong) UIButton *loadNativeAd2;
@property (nonatomic, strong) UIButton *loadNativeAd3;
@property (nonatomic, strong) UIButton *loadNativeAd4;
@property (nonatomic, strong) UIButton *loadNativeAd5;

@property (nonatomic ,strong) UIView *nativeView;

@property (nonatomic ,strong) UIScrollView *contentScroll;

@property (strong, nonatomic) YieldzoneNativeExpressAd *nativeAd;

@end

@implementation NativeAdViewController

///demo测试数据
#pragma mark ---广告资源切换

- (void)adMediaCheck:(id)sender {
    [self showNativeAlert];
}

- (UIView *)nativeView {
    if (!_nativeView) {
        _nativeView = [[UIView alloc]initWithFrame:CGRectMake(20, 250, [UIScreen mainScreen].bounds.size.width - 40, ([UIScreen mainScreen].bounds.size.width - 40)*0.8)];
        [self.view addSubview:_nativeView];
    }
    return _nativeView;
}

- (UIScrollView *)contentScroll {
    if (!_contentScroll) {
        _contentScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250)];
        _contentScroll.scrollEnabled = YES;
        _contentScroll.backgroundColor = UIColor.lightGrayColor;
        _contentScroll.userInteractionEnabled = YES;
        _contentScroll.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        [self.view addSubview:_contentScroll];
    }
    return _contentScroll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.contentScroll.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 900);
    
    _statusLabel = [[UILabel alloc]init];
    [_statusLabel setFont:[UIFont systemFontOfSize:16]];
    [_statusLabel setTextColor:[UIColor redColor]];
    [_statusLabel setTextAlignment:NSTextAlignmentCenter];
    _statusLabel.text = @"Tap button to load and show Ad";
    [self.contentScroll addSubview:_statusLabel];
    
    _statusLabel.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 25);
    
    
    self.loadNativeAd  = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loadNativeAd.layer.borderWidth = 0.5;
    self.loadNativeAd.layer.cornerRadius = 8;
    self.loadNativeAd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [self.loadNativeAd addTarget:self action:@selector(loadNativeAd:) forControlEvents:UIControlEventTouchUpInside];
    [self.loadNativeAd setTitle:@"LoadTopTextAd" forState:UIControlStateNormal];
    [self.loadNativeAd setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.contentScroll addSubview:self.loadNativeAd];

    self.loadNativeAd.frame = CGRectMake(10, CGRectGetMaxY(_statusLabel.frame) + 15, 135, 25);
    
    
    self.loadNativeAd2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loadNativeAd2.layer.borderWidth = 0.5;
    self.loadNativeAd2.layer.cornerRadius = 8;
    self.loadNativeAd2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //    self.loadNativeAd2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.loadNativeAd2 addTarget:self action:@selector(loadNativeAd2:) forControlEvents:UIControlEventTouchUpInside];
    [self.loadNativeAd2 setTitle:@"LoadTopMediaAd" forState:UIControlStateNormal];
    [self.loadNativeAd2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.contentScroll addSubview:self.loadNativeAd2];
    
    self.loadNativeAd2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 140, CGRectGetMaxY(_statusLabel.frame) + 15, 135, 25);
    
    self.loadNativeAd3 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loadNativeAd3.layer.borderWidth = 0.5;
    self.loadNativeAd3.layer.cornerRadius = 8;
    self.loadNativeAd3.layer.borderColor = [UIColor lightGrayColor].CGColor;

    [self.loadNativeAd3 addTarget:self action:@selector(loadNativeAd3:) forControlEvents:UIControlEventTouchUpInside];
    [self.loadNativeAd3 setTitle:@"LoadLeftMediaAd" forState:UIControlStateNormal];
    [self.loadNativeAd3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    self.loadNativeAd3.frame = CGRectMake(10, CGRectGetMaxY(self.loadNativeAd.frame) + 15, 135, 25);
    
    [self.contentScroll addSubview:self.self.loadNativeAd3];
    
    self.loadNativeAd4 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loadNativeAd4.layer.borderWidth = 0.5;
    self.loadNativeAd4.layer.cornerRadius = 8;
    self.loadNativeAd4.layer.borderColor = [UIColor lightGrayColor].CGColor;

    [self.loadNativeAd4 addTarget:self action:@selector(loadNativeAd4:) forControlEvents:UIControlEventTouchUpInside];
    [self.loadNativeAd4 setTitle:@"LoadLeftTextAd" forState:UIControlStateNormal];
    [self.loadNativeAd4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    self.loadNativeAd4.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 140, CGRectGetMaxY(self.loadNativeAd.frame) + 15, 135, 25);

    [self.contentScroll addSubview:self.self.loadNativeAd4];
    
    
    self.loadNativeAd5 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loadNativeAd5.layer.borderWidth = 0.5;
    self.loadNativeAd5.layer.cornerRadius = 8;
    self.loadNativeAd5.layer.borderColor = [UIColor lightGrayColor].CGColor;
 
    [self.loadNativeAd5 addTarget:self action:@selector(loadNativeAd5:) forControlEvents:UIControlEventTouchUpInside];
    [self.loadNativeAd5 setTitle:@"LoadThreePicAd" forState:UIControlStateNormal];
    [self.loadNativeAd5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    self.loadNativeAd5.frame = CGRectMake(10, CGRectGetMaxY(self.loadNativeAd4.frame) + 15, 135, 25);
    [self.contentScroll addSubview:self.loadNativeAd5];
   
    //    UIButton *removeNativeAd = [UIButton buttonWithType:UIButtonTypeSystem];
    //    removeNativeAd.layer.borderWidth = 0.5;
    //    removeNativeAd.layer.cornerRadius = 8;
    //    removeNativeAd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //    removeNativeAd.translatesAutoresizingMaskIntoConstraints = NO;
    //    [removeNativeAd addTarget:self action:@selector(removeNativeAd:) forControlEvents:UIControlEventTouchUpInside];
    //    [removeNativeAd setTitle:@"removeNativeAd" forState:UIControlStateNormal];
    //    [removeNativeAd setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    [self.contentScroll addSubview:removeNativeAd];
    //    [self.contentScroll addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[removeNativeAd]-170-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(removeNativeAd)]];
    //    [self.contentScroll addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[self.loadNativeAd3]-20-[removeNativeAd(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self.loadNativeAd3,removeNativeAd)]];
    
    
}

- (void)removeNativeAd:(id)sender {
    self.statusLabel.text = @"Loading......";
    for (YieldzoneNativeExpressAdView *view in self.nativeView.subviews) {
        if ([view isKindOfClass:[YieldzoneNativeExpressAdView class]]) {
            [view adClosePlayer];
            [view removeFromSuperview];
        }
    }
    
}

- (void)loadNativeAd3:(id)sender {
    [self removeNativeAd:nil];
    
    self.nativeView.frame = CGRectMake(20, 250, [UIScreen mainScreen].bounds.size.width - 40, ([UIScreen mainScreen].bounds.size.width - 40)*0.35);
    
    self.nativeAd = [[YieldzoneNativeExpressAd alloc]initWithPlacementId:test_native_pid adSize:self.nativeView.frame.size];
    self.nativeAd.delegate = self;
    self.nativeAd.nativeAdType = YieldzoneNativeExpressLeftMediaRightText;
    [self.nativeAd loadAd];
}

- (void)loadNativeAd4:(id)sender {
    [self removeNativeAd:nil];
    self.nativeView.frame = CGRectMake(20, 250, [UIScreen mainScreen].bounds.size.width - 40, ([UIScreen mainScreen].bounds.size.width - 40)*0.35);
    
    self.nativeAd = [[YieldzoneNativeExpressAd alloc]initWithPlacementId:test_native_pid adSize:self.nativeView.frame.size];
    self.nativeAd.delegate = self;
    self.nativeAd.nativeAdType = YieldzoneNativeExpressRightMediaLeftText;
    [self.nativeAd loadAd];
}

- (void)loadNativeAd2:(id)sender  {
    [self removeNativeAd:nil];
    self.nativeView.frame = CGRectMake(20, 250, [UIScreen mainScreen].bounds.size.width - 40, ([UIScreen mainScreen].bounds.size.width - 40)*0.8);
    
    self.nativeAd = [[YieldzoneNativeExpressAd alloc]initWithPlacementId:test_native_pid adSize:self.nativeView.frame.size];
    self.nativeAd.delegate = self;
    self.nativeAd.nativeAdType = YieldzoneNativeExpressTopMediaBottomText;
    [self.nativeAd loadAd];
}

- (void)loadNativeAd:(id)sender {
    [self removeNativeAd:nil];
    self.nativeView.frame = CGRectMake(20, 250, [UIScreen mainScreen].bounds.size.width - 40, ([UIScreen mainScreen].bounds.size.width - 40)*0.8);
    self.nativeAd = [[YieldzoneNativeExpressAd alloc]initWithPlacementId:test_native_pid adSize:self.nativeView.frame.size];
    self.nativeAd.delegate = self;
    self.nativeAd.nativeAdType = YieldzoneNativeExpressTopTextBottomMedia;
    [self.nativeAd loadAd];

}

- (void)loadNativeAd5:(id)sender {
    [self removeNativeAd:nil];
    self.nativeView.frame = CGRectMake(20, 250, [UIScreen mainScreen].bounds.size.width - 40, ([UIScreen mainScreen].bounds.size.width - 40)*0.45);
    self.nativeAd = [[YieldzoneNativeExpressAd alloc]initWithPlacementId:test_native_pid adSize:self.nativeView.frame.size];
    self.nativeAd.delegate = self;
    self.nativeAd.nativeAdType = YieldzoneNativeExpressThreePicText;
    [self.nativeAd loadAd];

}

#pragma mark----delegate

/**
 *
 */
- (void)nativeExpressAdSuccessToLoad:(YieldzoneNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof YieldzoneNativeExpressAdView *> *)views {
    self.statusLabel.text = @"Ad loaded Success";
    YieldzoneNativeExpressAdView *view = views.firstObject;
    view.controller = self;
    [view render];
    [self.nativeView addSubview:view];
    view.frame = self.nativeView.bounds;
    
}


/**
 *
 */
- (void)nativeExpressAdFailToLoad:(YieldzoneNativeExpressAd *)nativeExpressAd error:(NSError *)error {
    self.statusLabel.text = @"Ad loaded fail";
}


/**
 *
 */
- (void)nativeExpressAdViewRenderSuccess:(YieldzoneNativeExpressAdView *)nativeExpressAdView {
    self.statusLabel.text = @"Ad loaded render success";
}

/**
 *
 */
- (void)nativeExpressAdViewRenderFail:(YieldzoneNativeExpressAdView *)nativeExpressAdView {
    self.statusLabel.text = @"Ad loaded render fail";
}


/**
 *
 */
- (void)nativeExpressAdViewExposure:(YieldzoneNativeExpressAdView *)nativeExpressAdView {
    self.statusLabel.text = @"Ad loaded exposure";
    
    
}


/**
 *
 */
- (void)nativeExpressAdViewClosed:(YieldzoneNativeExpressAdView *)nativeExpressAdView {
    
}

- (void)nativeExpressAdWillLeaveApplication:(YieldzoneNativeExpressAdView *)nativeExpressAdView {
    
}

- (void)dealloc {
    NSLog(@"NativeAdViewController---dealloc");
}

@end
