//
//  YZSelectOilTableViewController.m
//  爱皂坊beta1
//
//  Created by YaguangZhu on 15/9/21.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "YZSelectOilTableViewController.h"
#import "HMStatus.h"
#import "HMStatusCell.h"
//#import "StatusFrame.h"

@interface YZSelectOilTableViewController ()
@property(nonatomic,strong) NSArray *statuseFrames;
@property(nonatomic,strong) NSArray *statuses;
@end

@implementation YZSelectOilTableViewController
- (NSArray *)statuses
{
    if (_statuses ==nil) {
        _statuses = [HMStatus statuses];
    }
    return _statuses;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 400;
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.statuses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID =@"cell";
    HMStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell ==nil) {
        cell = [[HMStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
     cell.status = self.statuses[indexPath.row];
    
     cell.status.weight = [NSNumber numberWithInt:11];
    return cell;
}

#pragma mark - 代理方法
/** 计算单元格行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     计算行高的方法，会在加载表格数据时，有多少行计算多少次 contentSize
     
     问题：此方法执行的时候，cell还没有被实例化！
     但是：行高计算是在实例化cell时，通过设置status属性，计算的=>有了status模型，就可以知道行高！
     
     问题：如何在cell实例化之前，获得行高？
     解决方法：通过status可以计算得到行高！=》再建立一个模型，专门计算所有控件的位置
     */
    
//    StatusFrame *statusFrame = [[StatusFrame alloc] init];
//    statusFrame.status =self.statuses[indexPath.row];
//    return statusFrame.cellHeight;
    
    
    return 135;
}

@end
