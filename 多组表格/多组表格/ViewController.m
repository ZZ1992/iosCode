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
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    Hero *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.imageView.image =[UIImage imageNamed:hero.icon];
    cell.detailTextLabel.text = hero.intro;
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.accessoryType =UITableViewCellAccessoryDetailButton;
    
    
    
    UISwitch * swicher = [[UISwitch alloc]init];
    
    [swicher addTarget:self action:@selector(swtichChanged :) forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = swicher;
    return cell;
}
- (void)swtichChanged:(UISwitch *)sender
{
    NSLog(@"%s  %@",__func__,sender);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
