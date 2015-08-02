//
//  ViewController.m
//  超级猜图
//
//  Created by YaguangZhu on 15/8/2.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "CZQuestion.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *questions;

@property(nonatomic,assign)int index;
@property(nonatomic,assign)CGRect iconFrame;
@property (weak, nonatomic) IBOutlet UILabel *lblIndex;
@property (weak, nonatomic) IBOutlet UIButton *btnIcon;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionsView;

@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnScore;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UIButton *cover;
- (IBAction)btnNextClick;
- (IBAction)bigImage;
- (IBAction)btnIconClick:(UIButton *)sender;

@end

@implementation ViewController

-(NSArray *)questions
{
    if (_questions == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel = [NSMutableArray array];
        
        
        for (NSDictionary *dict in arrayDict) {
            CZQuestion *model = [CZQuestion questionWithDict:dict];
            [arrayModel addObject:model];
        }
        
        _questions = arrayModel;
    }
    return _questions;
}

//改变状态栏的颜色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
////隐藏状态栏
//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.index = -1;
    [self nextQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNextClick {
    NSLog(@"sss");
    [self nextQuestion];
}

- (IBAction)bigImage {
    
    //纪录头像按钮的原始数据
    self.iconFrame = self.btnIcon.frame;
    //创建一个同样大小的按钮
    UIButton *btnCover = [[UIButton alloc]init];
    btnCover.frame = self.view.bounds;
    btnCover.backgroundColor = [UIColor blackColor];
    btnCover.alpha = 0.0;
    [self.view addSubview:btnCover];
    
    
    [btnCover addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view bringSubviewToFront:self.btnIcon];
    
    self.cover = btnCover;
    CGFloat iconW= self.view.frame.size.width;
    CGFloat iconH = iconW;
    CGFloat iconX = 0;
    CGFloat iconY = (self.view.frame.size.height - iconH)/2;
    
    [UIView animateWithDuration:1.0 animations:^{
        self.btnIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
        
         btnCover.alpha = 0.6;

    }];
   }

- (IBAction)btnIconClick:(UIButton *)sender {
    if (self.cover == nil) {
        [self bigImage];
    }else
    {
        [self smallImage];
    }

}

- (void)smallImage
{
    
    
    
    [UIView animateWithDuration:1.0 animations:^{
        self.btnIcon.frame =  self.iconFrame;
        
        self.cover.alpha = 0;
    
        [self.cover removeFromSuperview];    } completion:^(BOOL finished) {
            if (finished) {
              [self.cover removeFromSuperview];
                
                self.cover = nil;
            }
            
        }];
}


-(void)nextQuestion
{
    self.index++;
    
    CZQuestion *model = self.questions[self.index];
    [self settingData:model];
    [self makeAnswerButton:model];
    [self makeOptionButton:model];
    //动态创建答案按钮
    
    //创建前  清除按钮
//    while(self.answerView.subviews.firstObject)
//    {
//        [self.answerView.subviews.firstObject removeFromSuperview];
//    }
    
    
}
//创建待选答案按钮
-(void)makeOptionButton:(CZQuestion *)model
{
    [self.optionsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSArray *word = model.options;
    
    for (int i = 0; i< word.count; i++) {
        UIButton *btnOpt =  [ [UIButton alloc ]init];
        
        [btnOpt setBackgroundImage:[UIImage imageNamed:@"btnb1"] forState:UIControlStateNormal];
        [btnOpt setBackgroundImage:[UIImage imageNamed:@"btnb2"] forState:UIControlStateHighlighted];
        
        [btnOpt setTitle:word[i] forState:UIControlStateNormal];
        btnOpt.frame = CGRectMake(0, 0, 35, 35);
        
        [btnOpt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.optionsView addSubview:btnOpt];
    }
}
//加载数据

-(void)settingData:(CZQuestion *)model
{
    self.lblIndex.text =[NSString stringWithFormat:@"%d / %ld",(self.index+1),self.questions.count];
    self.lblTitle.text = model.title;
    [self.btnIcon setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    
    self.btnNext.enabled = self.index != self.questions.count-1;

}

//创建答案按钮
-(void)makeAnswerButton:(CZQuestion *)model
{
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSUInteger len = model.answer.length;
    CGFloat margin = 10;
    CGFloat answerW = 35;
    CGFloat answerH = 35;
    CGFloat answerY = 0;
    CGFloat marginleft = (self.answerView.frame.size.width- len*answerW -(len -1)*margin) /2;
    for (int i =0; i<len; i++) {
        UIButton *btnAnswer = [[UIButton alloc]init];
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btnb1"] forState:UIControlStateNormal];
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btnb2"] forState:UIControlStateHighlighted];
        
        CGFloat answerX = marginleft +i *(answerW +margin);
        
        btnAnswer.frame = CGRectMake(answerX, answerY, answerW, answerH);
        
        [self.answerView addSubview:btnAnswer];
    }

}
@end
