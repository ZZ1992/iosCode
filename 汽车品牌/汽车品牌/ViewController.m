//
//  ViewController.m
//  汽车品牌
//
//  Created by YaguangZhu on 15/8/16.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "carGroup.h"
#import "Car.h"
@interface ViewController ()<UITableViewDataSource>
@property(nonatomic,strong)NSArray *carGroups1;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSArray *)carGroups1
{
    if (_carGroups1 == nil) {
        _carGroups1 = [carGroup carGroups1];
    }
    
    return _carGroups1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   // NSLog(@"%@",self.carGroups1);
    [self tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//数据源方法
//分组的总数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups1.count;
}

//每一组的总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    carGroup *group = self.carGroups1[section];
    
    return group.cars.count;
}

//单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    carGroup *group = self.carGroups1[indexPath.section];
    Car *car = group.cars[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    
    
    return cell;
}

//标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    carGroup *group = self.carGroups1[section];
    return group.title;
}

//右侧索引列表
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
   /* NSMutableArray *arrayM = [NSMutableArray array];
    for (carGroup *group in self.carGroups1) {
        [arrayM addObject:group.title];
    }
    return arrayM;*/
    
    
    //kvc 是cocoa 的大招
    
    return [self.carGroups1 valueForKeyPath:@"title"];
}



@end




















