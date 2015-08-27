//
//  ViewController.m
//  新浪微博
//
//  Created by YaguangZhu on 15/8/26.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "HMStatus.h"
#import "HMStatusCell.h"
#import "StatusFrame.h"

@interface ViewController ()
@property(nonatomic,strong) NSArray *statuseFrames;
@property(nonatomic,strong) NSArray *statuses;
@end

@implementation ViewController

//- (NSArray *)statusFrames
//{
//    if (_statuseFrames ==nil) {
//        _statuseFrames = [StatusFrame statusFrames];
//    }
//    return _statuseFrames;
//}

- (NSArray *)statuses
{
    if (_statuses ==nil) {
        _statuses = [HMStatus statuses];
    }
    return _statuses;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.statuseFrames.count;
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID =@"cell";
    
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell ==nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
    HMStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
   if (cell ==nil) {
    cell = [[HMStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
         }
    
//    HMStatus *status = self.statuses[indexPath.row];
//    cell.textLabel.text =status.name;
    
    
    cell.status = self.statuses[indexPath.row];
    
//    StatusFrame *statusFrame = self.statuseFrames[indexPath.row];
//    cell.status = statusFrame.status;
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
    
    StatusFrame *statusFrame = [[StatusFrame alloc] init];
    statusFrame.status =self.statuses[indexPath.row];
    return statusFrame.cellHeight;
    
    
    //return 400;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 400;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
