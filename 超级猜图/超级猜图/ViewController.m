//
//  ViewController.m
//  超级猜图
//
//  Created by YaguangZhu on 15/8/2.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "CZQuestion.h"
@interface ViewController () <UIAlertViewDelegate>
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
- (IBAction)btnTipClick;

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

- (IBAction)btnTipClick {
    //－1000
    [self addScore:-1000];
    
    //答案 清空
    for (UIButton *btnAnswer in self.answerView.subviews) {
        [self btnAnswerclick:btnAnswer];
    }
    
    //给出提示
    
    CZQuestion *model = self.questions[self.index];
    
    NSString *fristChar = [model.answer substringToIndex:1];
    
    for (UIButton *btnOpt in self.optionsView.subviews) {
        if ([btnOpt.currentTitle isEqualToString:fristChar]) {
            [self btnOPtionClick:btnOpt];
            break;
        }
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

//实现uialertview代理方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        self.index =-1;
        [self nextQuestion];
    }
}


-(void)nextQuestion
{
    self.index++;
    
    // 索引越界
    
    if (self.index == self.questions.count) {
      UIAlertView *alertView  =[[UIAlertView alloc] initWithTitle:@"操作提示" message:@"恭喜通关" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        return;
    }
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
    
    CGFloat optionW = 35;
    CGFloat optionH =35;
    CGFloat margin = 10;
    int colum = 7;
    CGFloat marginLeft = (self.optionsView.frame.size.width- colum * optionW- (colum-1) *margin)/2;
    
    
    for (int i = 0; i< word.count; i++) {
        UIButton *btnOpt =  [ [UIButton alloc ]init];
        
        //给其唯一一个tag直
        btnOpt.tag = i;
        
        [btnOpt setBackgroundImage:[UIImage imageNamed:@"btnb1"] forState:UIControlStateNormal];
        [btnOpt setBackgroundImage:[UIImage imageNamed:@"btnb2"] forState:UIControlStateHighlighted];
        
        [btnOpt setTitle:word[i] forState:UIControlStateNormal];
        btnOpt.frame = CGRectMake(0, 0, 35, 35);
        int colIdx = i % colum;
        int rowIdx = i / colum;
        CGFloat optionX = marginLeft+ colIdx*(optionW+margin);
        CGFloat optionY =  0 +rowIdx *(optionH +margin);
        btnOpt.frame = CGRectMake(optionX, optionY, optionW, optionH);
        [btnOpt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.optionsView addSubview:btnOpt];
        
        // click event
        [btnOpt addTarget:self action:@selector(btnOPtionClick :) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}

//待选按钮点击事件
- (void)btnOPtionClick:(UIButton *)sender
{
    sender.hidden = YES;
   // NSString *text = [sender titleForState:UIControlStateNormal];
    NSString *text = sender.currentTitle;
    
    //把按钮文字放到上面 遍历
       for (UIButton *answerBtn in self.answerView.subviews)
    {
        if (answerBtn.currentTitle == nil) {
            [answerBtn setTitle:text forState:UIControlStateNormal];
            
            answerBtn.tag = sender.tag;
           
            break;
        }
    }
    
    //判断答案按钮是否满了
    
    BOOL isFull = YES;
    NSMutableString *userInput = [NSMutableString string];
    
    
    for (UIButton *btnAnswer in self.answerView.subviews) {
        if (btnAnswer.currentTitle == nil) {
            isFull = NO;
            
            break;
        }else
        {
            [userInput appendString:btnAnswer.currentTitle];
        }
    }
    //如果答案按钮满了 判断是否正确 正确下一题 错误字体变红
    if (isFull) {
        self.optionsView.userInteractionEnabled = NO;
        CZQuestion *model = self.questions[self.index];
        
        if ([model.answer isEqualToString:userInput]) {
            
            
            [self settingAnswerButtonTitleColor:[UIColor blueColor]];
            
            //进入下一题 0.5秒后
            [self performSelector:@selector(nextQuestion) withObject:nil afterDelay:0.5];
            
            [self addScore:100];
        }else
        {
            [self settingAnswerButtonTitleColor:[UIColor redColor]];
        }
        
    }
    
   
    
    
}
//提取一个方法 设置颜色
- (void)settingAnswerButtonTitleColor:(UIColor *)color
{
    for (UIButton *btnAnswer in self.answerView.subviews) {
        [btnAnswer setTitleColor:color forState:UIControlStateNormal];
    }
}
//加分或者减分按钮
- (void)addScore:(int)score
{
    NSString *str = self.btnScore.currentTitle;
    int currentScore = str.intValue;
    currentScore = currentScore+score;
    [self.btnScore setTitle:[NSString stringWithFormat:@"%d",currentScore] forState:UIControlStateNormal];
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
    
    self.optionsView.userInteractionEnabled = YES;
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
        
        //设置颜色
        [btnAnswer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self.answerView addSubview:btnAnswer];
        
        [btnAnswer addTarget:self action:@selector(btnAnswerclick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    

}
-(void)btnAnswerclick:(UIButton *)sender
{
    self.optionsView.userInteractionEnabled = YES;
    
    [self settingAnswerButtonTitleColor:[UIColor blackColor]];
    for (UIButton *option in self.optionsView.subviews) {

        if (sender.tag == option.tag) {
            option.hidden = NO;
            break;
        }}
    
    
    [sender setTitle:nil forState:UIControlStateNormal];
}
@end
