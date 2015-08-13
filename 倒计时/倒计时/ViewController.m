//
//  ViewController.m
//  倒计时
//
//  Created by YaguangZhu on 15/8/11.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property(strong,nonatomic)NSTimer *timer;
@end

@implementation ViewController

- (IBAction)start
{
   self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:@"he;llo timer" repeats:YES];
    
}


- (void)updateTimer:(NSTimer *)timer
{
    int counter = self.counterLabel.text.intValue;
    if (counter==0) {
        [self pause];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"开始" message:@"开始啦…………" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
    }else
    {
    self.counterLabel.text= [NSString stringWithFormat:@"%d",--counter];
    }
}


- (IBAction)pause
{
    [self.timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
