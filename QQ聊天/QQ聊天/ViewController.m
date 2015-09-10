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
#import "HMMessageFrameModel.h"

@interface ViewController ()<UITabBarControllerDelegate,UITableViewDataSource,UITextFieldDelegate>
//@property(nonatomic,strong) NSArray *messages;
@property(nonatomic,strong) NSMutableArray *messagesFrame;
@property (weak, nonatomic) IBOutlet UITextField *inputView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

//自动回复数组
@property (nonatomic, strong)NSDictionary *autoReplay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.allowsSelection = NO;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
    
    self.tableView.separatorStyle =UITableViewCellEditingStyleNone;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    //设置做边距
    self.inputView.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    //一直显示
    self.inputView.leftViewMode = UITextFieldViewModeAlways;
    
    }

//点击右下角的send 按钮
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"-------%@",textField.text);
    [self addMessage:textField.text type:HMMessageModelGatsby];
    
    
    //自动回复
    NSString *autoStr = [self autoReplayWithText:textField.text];
    //将自动回复添加成一天聊天信息
    [self addMessage:autoStr type:HMMessageModelJobs];
    //4. 清空表格
    
    self.inputView.text = @"";//nil
    
    
    
       return YES;
}


//自动回复一条聊天信息

- (NSString *)autoReplayWithText:(NSString *)text
{
    //3自动回复
    for (int a = 0 ; a < text.length; a++) {
        
        NSString *subStr = [text substringWithRange:NSMakeRange(a, 1)];
        
        if (self.autoReplay[subStr]) {
            return  self.autoReplay[subStr];
        }
    }
    
    return @"滚蛋吗0";
}

- (void)addMessage:(NSString *)text type:(HMMessageModeltype)type
{
    HMMessageModel *msg = [[HMMessageModel alloc]init];
    msg.time = @"17:25";
    msg.text = text;
    msg.type = type;
    
    HMMessageFrameModel *fm = [[HMMessageFrameModel alloc]init];
    fm.message =msg;
    [self.messagesFrame addObject:fm];
    
    [self.tableView reloadData];
    //3. 自动上移
    //移动的位置
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messagesFrame.count - 1 inSection:0];
    //真正去是位置 atSrcollPosition :  滚到位置
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
   
}

- (void)keyboardDidChangeFrame:(NSNotification *)noti
{
    NSLog(@"--------%@",noti.userInfo);
    
    //改变window的背景颜色
    self.view.window.backgroundColor = self.tableView.backgroundColor;
    
    //最终键盘的frame
    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //键盘实时y
    CGFloat keyY = frame.origin.y;
    
    //屏幕的高度
    CGFloat screenH = [[UIScreen mainScreen] bounds].size.height;
    
    //动画时间
    CGFloat keyDuration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //执行动画
    [UIView animateWithDuration:keyDuration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyY - screenH);
    }];

}

//当tableview 滚动的时候 结束编辑事件  （退出键盘）
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

//-(NSArray *)messages
//{
//    if (_messages == nil) {
//        _messages = [HMMessageModel messages];
//    }
//    return _messages;
//}
- (NSArray *)messagesFrame
{
    if (_messagesFrame == nil) {
        _messagesFrame = [HMMessageFrameModel messageFrame];
    }
    return _messagesFrame;
}

//懒加载自动回复文件
- (NSDictionary *)autoReplay
{
    if (_autoReplay == nil) {
        _autoReplay  = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autoReplay.plist" ofType:nil]];
    }
    return _autoReplay;
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messagesFrame.count;
}

- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *ID =@"cell";
//    
//    HMMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if (cell ==nil) {
//        cell = [[HMMessageCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        
//    }
    
    HMMessageCell *cell = [HMMessageCell messageCellWithTableView:tableView];

   // cell.messageModel =self.messages[indexPath.row];
    
    HMMessageFrameModel *model = self.messagesFrame[indexPath.row];
    
    cell.frameModel =model;
    
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
    
//    HMMessageFrameModel *messageFrame1 = [[HMMessageFrameModel alloc] init];
//    messageFrame1.message =self.messagesFrame[indexPath.row];
//    return messageFrame1.cellH;
    
    HMMessageFrameModel *messageFrame1 = self.messagesFrame[indexPath.row];
       return messageFrame1.cellH;
    
    //return 200;
}




@end
