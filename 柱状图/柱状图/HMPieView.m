//
//  HMPieView.m
//  饼图
//
//  Created by YaguangZhu on 15/9/9.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMPieView.h"
#import "UIColor+Random.h"

@implementation HMPieView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSArray *data = @[@25,@25,@50];
    int count = data.count;
    
    CGFloat w = rect.size.width/(2*count -1);
    CGFloat h =0;
    CGFloat x =0;
    CGFloat y =0;
    CGFloat viewH = rect.size.height;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    for (int i  = 0 ; i< count; i++) {
        h = viewH * [data[i] intValue]/100.0;
        x= 2 * w * i;
        y= viewH - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        CGContextAddPath(ctx, path.CGPath);
        
        [[UIColor randomColor]set];
        CGContextFillPath(ctx);
        
    }
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

@end
