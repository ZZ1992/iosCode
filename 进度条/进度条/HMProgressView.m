//
//  HMProgressView.m
//  进度条
//
//  Created by YaguangZhu on 15/9/9.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMProgressView.h"
@interface HMProgressView()

@property(nonatomic,weak)UILabel *label;
@end

@implementation HMProgressView
- (UILabel *)label
{
    if (_label == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _label = label;
    }
    return _label;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    self.label.text = [NSString stringWithFormat:@"%.2f%%",progress*100];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(50, 50);
    CGFloat startA = -M_PI_2;
    CGFloat radius = 50-2;
    CGFloat endA = -M_PI_2 +_progress * M_PI *2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
     CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
    
   
}


@end
