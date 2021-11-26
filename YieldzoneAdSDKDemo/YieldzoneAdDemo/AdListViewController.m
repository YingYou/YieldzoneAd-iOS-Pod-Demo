//
//  AdListViewController.m
//  YieldzoneAdDemo
//
//  Created by Wei yang on 2021/2/2.
//  Copyright © 2021 Yieldzone. All rights reserved.
//

#import "AdListViewController.h"

#define Title @"title"
#define ClassTitle @"class"

@interface AdListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation AdListViewController

- (NSMutableArray *)listArray
{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
        [_listArray addObject:@{Title:@"Native",ClassTitle:@"NativeAdViewController"}];
        [_listArray addObject:@{Title:@"Splash",ClassTitle:@"SplashAdViewController"}];
        [_listArray addObject:@{Title:@"Banner",ClassTitle:@"BannerAdViewController"}];

        [_listArray addObject:@{Title:@"Interstitial",ClassTitle:@"InterstitialAdViewController"}];
        [_listArray addObject:@{Title:@"RewardVideo",ClassTitle:@"RewardVideoViewController"}];
        //DrawVideoViewController
        [_listArray addObject:@{Title:@"DrawVideo",ClassTitle:@"DrawVideoViewController"}];
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Yieldzone demo1";
    
    UITableView *listView = [[UITableView alloc] initWithFrame:self.view.bounds];
    listView.delegate =  self;
    listView.dataSource = self;
    listView.tableFooterView = [[UIView alloc] init];
    listView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:listView];
    
    UIButton *leftbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];

    //[leftbutton setBackgroundColor:[UIColor blackColor]];//v1.0.0
    [leftbutton setTitle:@"工程模式" forState:UIControlStateNormal];
    [leftbutton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(devModel:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftitem=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];

    self.navigationItem.leftBarButtonItem=leftitem;
}

- (void)devModel:(id)sender {
    Class debugVC = NSClassFromString(@"YieldzoneDebugViewController");
    id vc = [[debugVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.listArray[indexPath.row] objectForKey:Title];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *classStr = [self.listArray[indexPath.row] objectForKey:ClassTitle];
    Class vcClass = NSClassFromString(classStr);
    UIViewController *vc = [[vcClass alloc] init];
    vc.title = [self.listArray[indexPath.row] objectForKey:Title];
    [self.navigationController pushViewController:vc animated:YES];
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
