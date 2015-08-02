
//
//  ViewController.m
//  动态创建按钮
//
//  Created by YaguangZhu on 15/7/29.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIButton *button = [[UIButton alloc] init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"hdhdh" forState:UIControlStateNormal];
    [button setTitle:@"sss" forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    UIImage *imgNormal = [UIImage imageNamed:@"01"];
    UIImage *imgHigh = [UIImage imageNamed:@"02"];
    
    [button setBackgroundImage:(imgNormal ) forState:UIControlStateNormal];
    [button setBackgroundImage:(imgHigh) forState:UIControlStateHighlighted];
    
    button.frame = CGRectMake(50, 100, 100, 100);
    //单击事件
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonClick
{
    NSLog(@"ssss");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
