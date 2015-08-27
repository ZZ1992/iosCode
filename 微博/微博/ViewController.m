//
//  ViewController.m
//  微博
//
//  Created by YaguangZhu on 15/8/21.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "Status.h"
#import "ViewController.h"
#import "StatusCell.h"

@interface ViewController ()
@property(nonatomic,strong) NSArray *statuses;
@end

@implementation ViewController
- (NSArray *)statuses
{
    if (_statuses ==nil) {
        _statuses = [Status statuses];
    }
    return _statuses;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID =@"cell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell ==nil) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.status = self.statuses[indexPath.row];
    
   
    
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     self.tableView.rowHeight = 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 200;
}

@end
