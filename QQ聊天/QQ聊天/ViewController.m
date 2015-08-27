//
//  ViewController.m
//  QQ聊天
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "HMMessageModel.h"
#import "HMMessageCell.h"

@interface ViewController ()<UITabBarControllerDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSArray *messages;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    }

- (NSArray *)messages
{
    if (_messages == nil) {
        _messages = [HMMessageModel Messages];
    }
    return _messages;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID =@"cell";
    
    HMMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell ==nil) {
        cell = [[HMMessageCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    cell.messageModel = self.messages[indexPath.row];
    
    return cell;
    
}


#pragma mark - 代理方法
/** 计算单元格行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
          
     问题：如何在cell实例化之前，获得行高？
     解决方法：通过status可以计算得到行高！=》再建立一个模型，专门计算所有控件的位置
     */
    
    
    
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
