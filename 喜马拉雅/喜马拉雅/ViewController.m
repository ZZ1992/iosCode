//
//  ViewController.m
//  喜马拉雅
//
//  Created by YaguangZhu on 15/8/4.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scollView;
@property (weak, nonatomic) IBOutlet UIButton *lastButton;

@end

@implementation ViewController
- (void)setScollView:(UIScrollView *)scollView
{
    _scollView = scollView;
    self.scollView.contentInset = UIEdgeInsetsMake(24, 0, 29, 0);
    
    //设置滚动内容
    CGFloat h = CGRectGetMaxX(self.lastButton.frame)+10;
    self.scollView.contentSize = CGSizeMake(0, h);
    // self.scollView.contentOffset = CGPointMake(0, -34);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
      //self.scollView.contentInset = UIEdgeInsetsMake(24, 0, 0, 0);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
