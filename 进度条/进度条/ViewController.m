//
//  ViewController.m
//  进度条
//
//  Created by YaguangZhu on 15/9/9.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "HMProgressView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet HMProgressView *progressView;

@end

@implementation ViewController
- (IBAction)valueChange:(UISlider *)sender {
    _progressView.progress = sender.value;
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
