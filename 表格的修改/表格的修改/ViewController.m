//
//  ViewController.m
//  表格的修改
//
//  Created by YaguangZhu on 15/8/16.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITabBarControllerDelegate>
@property (nonatomic,strong)NSMutableArray *dataList;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithObjects:@"zhangsan", @"lisi", @"wangwu", @"zhangsan", @"lisi", @"wangwu", @"zhangsan", @"lisi", @"wangwu", @"zhangsan", @"lisi", @"wangwu", @"zhangsan", @"lisi", @"wangwu", @"zhangsan", @"lisi", @"wangwu", @"zhangsan", @"lisi", @"wangwu", @"zhangsan", @"lisi", @"wangwuwangwuwangwuwangwuwangwu", nil];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    // 开始编辑，一旦editing == YES就默认开启删除模式
    self.tableView.editing = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 设置表格
    cell.textLabel.text = self.dataList[indexPath.row];
    
    return cell;
}

// 只要实现了此方法，就能够支持手势拖拽删除了，删除需要自己干！
/**
 UITableViewCellEditingStyleNone,
 UITableViewCellEditingStyleDelete,     删除
 UITableViewCellEditingStyleInsert      添加
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"要删除");
        
        // MVC => 数据是保存在模型中
        // 1. 删除self.dataList中indexPath对应的数据
        [self.dataList removeObjectAtIndex:indexPath.row];
        NSLog(@"%@", self.dataList);
        
        // 2. 刷新表格(重新加载数据)
        // 重新加载所有数据
        //        [self.tableView reloadData];
        // deleteRowsAtIndexPaths让表格控件动画删除指定的行
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"要添加数据");
        
        // 1. 向数组添加数据
        [self.dataList insertObject:@"王小二" atIndex:indexPath.row + 1];
        // 2. 刷新表格
        //        [self.tableView reloadData];
        // insertRowsAtIndexPaths让表格控件动画在指定indexPath添加指定行
        // 新建一个indexPath
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
        
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
    }
}


#pragma mark - 代理方法
// 返回编辑样式，如果没有实现此方法，默认都是删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.row % 2) {
    //        return UITableViewCellEditingStyleInsert;
    //    } else {
    //        return UITableViewCellEditingStyleDelete;
    //    }
    return UITableViewCellEditingStyleInsert;
}
// 只要实现此方法，就可以显示拖动控件
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 界面数据UITableView已经完成了
    // 调整数据即可
    //    [self.dataList exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    // 1. 将源从数组中取出
    id source = self.dataList[sourceIndexPath.row];
    // 2. 将源从数组中删除
    [self.dataList removeObjectAtIndex:sourceIndexPath.row];
    NSLog(@"%@", self.dataList);
    
    // 3. 将源插入到数组中的目标位置
    [self.dataList insertObject:source atIndex:destinationIndexPath.row];
    
    NSLog(@"%@", self.dataList);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
