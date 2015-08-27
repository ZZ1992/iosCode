//
//  ViewController.m
//  多组表格
//
//  Created by YaguangZhu on 15/8/13.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *heros;
@end

@implementation ViewController

- (NSArray *)heros
{
    if (_heros == nil) {
        _heros = [Hero heros];
    }
        return _heros;
}
-(UITableView *)tableView
{
    if (_tableView ==nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    self.tableView.rowHeight = 80;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    head.backgroundColor = [UIColor redColor];
     self.tableView.tableHeaderView = head;
    
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    foot.backgroundColor = [UIColor redColor];

   //foot 做刷新  head 做广告
    self.tableView.tableFooterView =foot;
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    //为了加入缓存池，换个代码 下面这句重写
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
//static 静态变量 能够保证系统为变量在内存中只分配一次内存空间,但不能创建太多，因为不会被释放，只有程序销毁时，才会释放
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
         //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryType =UITableViewCellAccessoryDetailButton;
        // 设置背景图和选中 的图
       /* cell.backgroundColor = [UIColor redColor];
        UIImage *bgimg = [UIImage imageNamed:@"img_01"];
        
        cell.backgroundView = [[UIImageView alloc] initWithImage:bgimg];
        UIImage *selectBGimg = [UIImage imageNamed:@"img_02"];
        cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:selectBGimg];*/

    }
    
    Hero *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.imageView.image =[UIImage imageNamed:hero.icon];
    cell.detailTextLabel.text = hero.intro;
    
   
    
    
    
   　/* 
         开关
     UISwitch * swicher = [[UISwitch alloc]init];
    
    [swicher addTarget:self action:@selector(swtichChanged :) forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = swicher;*/
    return cell;
}
//开关
- (void)swtichChanged:(UISwitch *)sender
{
    NSLog(@"%s  %@",__func__,sender);
}
// 详细
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //按钮
}-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
