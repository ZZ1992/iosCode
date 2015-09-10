//
//  ViewController.m
//  QQ好友列表
//
//  Created by YaguangZhu on 15/9/1.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "HMFriendsModel.h"
#import "HMFriendsGroupModel.h"
#import "HMHeaderView.h"
@interface ViewController ()<HMHeaderViewDelegate>
//存放fiend内容
@property (nonatomic, strong)NSArray *friendsArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiClcik) name:@"friend" object:nil];

}

- (void)notiClcik
{
    [self.tableView reloadData];
}

// 这个方法是在控制器销毁的时候调用
- (void)dealloc
{
    //非ARC  必须调取这个方法
    //    [super dealloc];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (NSArray *)friendsArr
{
    if (_friendsArr == nil) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray *friendsArray = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            HMFriendsGroupModel *model = [HMFriendsGroupModel friendsGroupWithDict:dict];
            
            [friendsArray addObject:model];
            
        }
        
        _friendsArr = friendsArray;
        
        
    }
    
    return _friendsArr;

}


//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    HMFriendsGroupModel *group = self.friendsArr[section];
//    return group.name;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    static NSString *ID = @"headerView";
//    UITableViewHeaderFooterView *header = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (header == nil) {
//        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:ID];
//        
//    }
//    
//    return header;
    
    HMHeaderView *header = [HMHeaderView headerViewWith:tableView];
    
    HMFriendsGroupModel *model = self.friendsArr[section];
    
    //让控制器充当headerView 的代理
       //header.delegate = self;
    
   //  sender  传过来的参数  ^ 是不block 象征 {};做相应操作
      header.block = ^(id sender){
            [tableView reloadData];
    
            NSLog(@"------%@",sender);
    
        };
    
    
    header.group = model;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - header的代理方法
- (void)headerView:(HMHeaderView *)view
{
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   HMFriendsGroupModel *model = self.friendsArr[section];
    //return model.friends.count;
    return model.open ? model.friends.count :0;
   

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friendsArr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *ID =@"friends";
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
        if (cell ==nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
            
        }
    
    //1 取出当前section  model
    HMFriendsGroupModel *group = self.friendsArr[indexPath.section];
    
    //2 取出当前section model 中的 row 行
    HMFriendsModel *model = group.friends[indexPath.row];
    
    
    cell.textLabel.text = model.name;
    //设置cell text  的颜色
    cell.textLabel.textColor = model.vip?[UIColor redColor]:[UIColor blackColor];

    cell.imageView.image = [UIImage imageNamed:model.icon];

    
 
    return cell;
}
@end
