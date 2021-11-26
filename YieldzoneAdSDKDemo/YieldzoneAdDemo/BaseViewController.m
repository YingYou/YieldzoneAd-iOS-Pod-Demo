//
//  BaseViewController.m
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/5/13.
//  Copyright © 2021 Yieldzone. All rights reserved.
//

#import "BaseViewController.h"


@interface YieldzoneNetTool : NSObject

@property (nonatomic, class) NSInteger apiMode;

@end

@interface SXLocalMapData : NSObject

+ (void)setAdMedia:(NSInteger)adType;

@end

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    Class netTool = NSClassFromString(@"YieldzoneNetTool");
        
    if (YieldzoneNetTool.apiMode == 3) {
        
        UIButton *leftbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];

        //[leftbutton setBackgroundColor:[UIColor blackColor]];//v1.0.0
        [leftbutton setTitle:@"广告媒资切换" forState:UIControlStateNormal];
        [leftbutton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [leftbutton addTarget:self action:@selector(adMediaCheck:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftitem=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];

        self.navigationItem.rightBarButtonItem=leftitem;
            
    }
    
}

- (void)adMediaCheck:(id)sender {
    
}

- (void)showBannerAlert {
    Class maplocal = NSClassFromString(@"SXLocalMapData");
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"选择广告媒资类型" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) weakSelf = self;

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"图片" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //SXLocalMapData
        [maplocal setAdMedia:1];
    }];
    [ac addAction:cancel];
    
    UIAlertAction *proAction = [UIAlertAction actionWithTitle:@"图文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [maplocal setAdMedia:2];
    }];
    [ac addAction:proAction];

    [self presentViewController:ac animated:true completion:nil];

}

- (void)showSplashAlert {
    Class maplocal = NSClassFromString(@"SXLocalMapData");
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"选择广告媒资类型" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) weakSelf = self;

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"图片" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //SXLocalMapData
        [maplocal setAdMedia:1];
    }];
    [ac addAction:cancel];
    
    UIAlertAction *proAction = [UIAlertAction actionWithTitle:@"视频" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [maplocal setAdMedia:3];
    }];
    [ac addAction:proAction];

    [self presentViewController:ac animated:true completion:nil];

}

- (void)showNativeAlert {
    Class maplocal = NSClassFromString(@"SXLocalMapData");
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"选择广告媒资类型" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) weakSelf = self;

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"图文" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //SXLocalMapData
        [maplocal setAdMedia:2];
    }];
    [ac addAction:cancel];
    
    UIAlertAction *proAction = [UIAlertAction actionWithTitle:@"视频" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [maplocal setAdMedia:3];
    }];
    [ac addAction:proAction];

    [self presentViewController:ac animated:true completion:nil];

}

- (void)showDrawNativeAlert {
    Class maplocal = NSClassFromString(@"SXLocalMapData");
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"选择广告媒资类型" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) weakSelf = self;

    UIAlertAction *proAction = [UIAlertAction actionWithTitle:@"视频" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [maplocal setAdMedia:3];
    }];
    [ac addAction:proAction];

    [self presentViewController:ac animated:true completion:nil];

}

- (void)drawAdInit {
    Class maplocal = NSClassFromString(@"SXLocalMapData");
    [maplocal setAdMedia:3];
}

- (void)showInterstitialAlert {
    Class maplocal = NSClassFromString(@"SXLocalMapData");
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"选择广告媒资类型" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) weakSelf = self;

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"图片" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [maplocal setAdMedia:1];
    }];
    [ac addAction:cancel];
    
    UIAlertAction *proAction = [UIAlertAction actionWithTitle:@"图文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [maplocal setAdMedia:2];
    }];
    [ac addAction:proAction];
    
    UIAlertAction *videoAction = [UIAlertAction actionWithTitle:@"视频" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [maplocal setAdMedia:3];
    }];
    [ac addAction:videoAction];

    [self presentViewController:ac animated:true completion:nil];

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
