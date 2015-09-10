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
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 120;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    for (NSNumber *number in data) {
        startA = endA;
        angle = number.intValue /100.0*M_PI*2;
        endA = startA +angle;
        UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path1 addLineToPoint:center];
        CGContextAddPath(ctx, path1.CGPath);
        [[UIColor randomColor]set];
        CGContextFillPath(ctx);
    };
    
    
   
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

- (void)drawPie
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 120;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    angle = 25 /100.0*M_PI*2;
    endA = startA +angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    CGContextAddPath(ctx, path.CGPath);
    [[UIColor redColor]set];
    CGContextFillPath(ctx);
    
    
    startA = endA;
    angle = 25 /100.0*M_PI*2;
    endA = startA +angle;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path1 addLineToPoint:center];
    CGContextAddPath(ctx, path1.CGPath);
    [[UIColor greenColor]set];
    
    CGContextFillPath(ctx);
    
    startA = endA;
    angle = 50 /100.0*M_PI*2;
    endA = startA +angle;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path2 addLineToPoint:center];
    CGContextAddPath(ctx, path2.CGPath);
    [[UIColor blueColor]set];
    
    CGContextFillPath(ctx);
}
@end
