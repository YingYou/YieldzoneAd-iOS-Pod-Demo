//
//  DrawVideoViewController.m
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/4/19.
//  Copyright © 2021 Yieldzone. All rights reserved.
//

#import "DrawVideoViewController.h"
#import "DrawVideoDetailsViewController.h"

@interface DrawVideoViewController ()
@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation DrawVideoViewController

///demo测试数据
#pragma mark ---广告资源切换

- (void)adMediaCheck:(id)sender {
    [self showDrawNativeAlert];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self drawAdInit];
    
    _statusLabel = [[UILabel alloc]init];
    [_statusLabel setFont:[UIFont systemFontOfSize:16]];
    [_statusLabel setTextColor:[UIColor redColor]];
    [_statusLabel setTextAlignment:NSTextAlignmentCenter];
    _statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _statusLabel.text = @"Tap button to load and show Ad";
    [self.view addSubview:_statusLabel];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_statusLabel]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_statusLabel)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-35-[_statusLabel(25)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_statusLabel)]];
    
    
    UIButton *loadDrawAd = [UIButton buttonWithType:UIButtonTypeSystem];
    loadDrawAd.layer.borderWidth = 0.5;
    loadDrawAd.layer.cornerRadius = 8;
    loadDrawAd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loadDrawAd.translatesAutoresizingMaskIntoConstraints = NO;
    [loadDrawAd addTarget:self action:@selector(loadDrawAd:) forControlEvents:UIControlEventTouchUpInside];
    [loadDrawAd setTitle:@"LoadDrawAd" forState:UIControlStateNormal];
    [loadDrawAd setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:loadDrawAd];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[loadDrawAd]-220-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(loadDrawAd)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statusLabel]-20-[loadDrawAd(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_statusLabel,loadDrawAd)]];
    
}

- (void)loadDrawAd:(id)sender {
    DrawVideoDetailsViewController *drawVC = [[DrawVideoDetailsViewController alloc]init];
    drawVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:drawVC animated:YES completion:nil];
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
