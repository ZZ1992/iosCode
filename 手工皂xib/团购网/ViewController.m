//
//  ViewController.m
//  团购网
//
//  Created by YaguangZhu on 15/8/18.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "Tg.h"
#import "TgCell.h"
@interface ViewController ()

@property(nonatomic,strong) NSArray *tgs;
@end

@implementation ViewController

- (NSArray *)tgs
{
    if (_tgs ==nil) {
        _tgs  = [Tg tgs];
    }
    return _tgs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 120;
    
    //调整边距 实现状态栏的干扰
    // 调整边距，可以让表格视图让开状态栏
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.tableFooterView = [[[NSBundle mainBundle] loadNibNamed:@"TgFooterView" owner:nil options:nil] lastObject];
    
    
    self.tableView.tableHeaderView =[[[NSBundle mainBundle] loadNibNamed:@"head" owner:nil options:nil] lastObject];
}

//隐藏状态栏
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *ID = @"Cell";
//    TgCell *cell1 = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
//    
//    if (cell1 == nil) {
//        //cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        
//        //从xib里面加载自定义视图
//        cell1 = [[[NSBundle mainBundle] loadNibNamed:@"TgCell" owner:nil options:nil] lastObject];
//    }
    
    TgCell *cell1 =[TgCell cellWithtableview:tableView];

    cell1.tg = self.tgs[indexPath.row];
       
    
    return cell1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
