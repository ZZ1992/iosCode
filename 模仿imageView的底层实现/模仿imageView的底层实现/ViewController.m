//
//  ViewController.m
//  模仿imageView的底层实现
//
//  Created by YaguangZhu on 15/9/9.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "HMUIimageView.h"
@interface ViewController ()
{
    HMUIimageView *_imgV;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
//    imgV.image = [UIImage imageNamed:@"liuyan"];
//    [self.view addSubview:imgV];
    
    HMUIimageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    imgV.image = [UIImage imageNamed:@"liuyan"];
    [self.view addSubview:imgV];
    _imgV = imgV;
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _imgV.image = [UIImage imageNamed:@"teacher"];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
