//
//  ViewController.m
//  查看大图
//
//  Created by YaguangZhu on 15/8/4.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scollView;
@property (nonatomic,strong) UIImageView *imgView;

@property(nonatomic,strong) UIImage *image;

@end

@implementation ViewController


-(void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imgView.image = image;
    [self.imgView sizeToFit ];
    
    self.scollView.contentSize = image.size;
}
- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc]init];
        [self.scollView addSubview:_imgView];
    }
    return _imgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scollView.contentSize = CGSizeMake(892, 632);
    self.image = [UIImage imageNamed:@"minion"];
    
    self.scollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    self.scollView.showsHorizontalScrollIndicator= NO;
    self.scollView.showsVerticalScrollIndicator = NO;
    self.scollView.contentOffset = CGPointMake(100, 100);
    self.scollView.bounces = NO;
    
    
    self.scollView.delegate = self;
    self.scollView.maximumZoomScale=2.0;
    self.scollView.minimumZoomScale=0.2;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)click
{
    CGPoint offset = self.scollView.contentOffset;
    
    offset.x +=20;
    offset.y +=20;
    self.scollView.contentOffset = offset;
    
}

//代理方法
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imgView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
