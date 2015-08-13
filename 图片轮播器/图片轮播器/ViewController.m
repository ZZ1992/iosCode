//
//  ViewController.m
//  图片轮播器
//
//  Created by YaguangZhu on 15/8/12.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation ViewController
- (UIScrollView *)scrollview
{
    if (_scrollview == nil) {
        _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 20, 300, 130)];
        _scrollview.backgroundColor = [UIColor redColor];
        [self.view addSubview:_scrollview];
        
        _scrollview.showsHorizontalScrollIndicator = NO;
        _scrollview.showsVerticalScrollIndicator = NO;
        _scrollview.pagingEnabled = YES;
        self.scrollview.contentSize = CGSizeMake(5 * _scrollview.bounds.size.width, 0);
        
        _scrollview.delegate = self;
    }
    return _scrollview;
}
- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.numberOfPages = 5;
        CGSize size =[_pageControl sizeForNumberOfPages:5];
        _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageControl.center = CGPointMake(self.view.center.x, 130);
        
        _pageControl.pageIndicatorTintColor = [UIColor blackColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        
        [self.view addSubview:_pageControl];
        
        [_pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (void)pageChange:(UIPageControl *)page
{
   // NSLog(@"%d",page.currentPage);
    CGFloat x = page.currentPage * self.scrollview.bounds.size.width;
    [self.scrollview setContentOffset:CGPointMake(x, 0) animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollview;
    for(int i= 0;i<5;i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i+1];
        UIImage *image =[UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.scrollview.bounds];
        imageView.image = image;
        [self.scrollview addSubview:imageView];
        
    }
    
    [self.scrollview.subviews enumerateObjectsUsingBlock:^(UIImageView *imageview, NSUInteger idx, BOOL *stop) {
        CGRect frame = imageview.frame;
        frame.origin.x = idx * frame.size.width;
        imageview.frame = frame;
    }];
    
    self.pageControl.currentPage = 0;
    
    //时钟
    [self startTimer];

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(updateTimer)  userInfo:nil  repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
- (void)updateTimer
{
    int page = (self.pageControl.currentPage+1)%5;
    self.pageControl.currentPage = page;
    [self pageChange:self.pageControl];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    self.pageControl.currentPage =page;
}
//抓住图片停止时钟 放下开始
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self startTimer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
