//
//  ViewController.m
//  应用程序下载
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "MJApp.h"
#import "CZAppsTableViewCell.h"


@interface ViewController ()
@property (strong, nonatomic) NSArray *apps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSArray *)apps
{
    if (_apps == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps_full.plist" ofType:nil]];
        
        NSMutableArray *appArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJApp *app = [MJApp appWithDict:dict];
            [appArray addObject:app];
        }
        _apps = appArray;
    }
    return _apps;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZAppsTableViewCell *cell = [CZAppsTableViewCell appsTableviewCellwithTableview:tableView];
    
    MJApp *model = self.apps[indexPath.row];
    
    cell.apps = model;
    //cell.delegate = self;
    //cell.app = self.apps[indexPath.row];
    return cell;
}

//- (void)appCellDidClickedDownloadBtn:(MJAppCell *)cell
//{
//    // 1.取出模型
//    MJApp *app = cell.app;
//    
//    // 2.添加标签
//    UILabel *label = [[UILabel alloc] init];
//    label.text = [NSString stringWithFormat:@"成功下载%@", app.name];
//    label.font = [UIFont systemFontOfSize:12];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor whiteColor];
//    label.backgroundColor = [UIColor blackColor];
//    label.frame = CGRectMake(0, 0, 150, 25);
//    label.center = CGPointMake(160, 240);
//    label.alpha = 0.0;
//    label.layer.cornerRadius = 5;
//    label.clipsToBounds = YES;
//    [self.view addSubview:label];
//    
//    // 3.动画
//    [UIView animateWithDuration:0.5 animations:^{
//        label.alpha = 0.5;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
//            label.alpha = 0.0;
//        } completion:^(BOOL finished) {
//            [label removeFromSuperview];
//        }];
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
