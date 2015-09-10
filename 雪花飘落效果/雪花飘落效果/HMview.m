//
//  HMview.m
//  雪花飘落效果
//
//  Created by YaguangZhu on 15/9/9.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMview.h"
@interface HMview()

@property(nonatomic,assign)CGFloat snowY;

@end

@implementation HMview

- (void)awakeFromNib
{
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    _snowY += 10;
    UIImage *imgae = [UIImage imageNamed:@"003"];
    [imgae drawAtPoint:CGPointMake(0, _snowY)];
    if (_snowY >= 480) {
        _snowY =0;
    }
    
}


@end
