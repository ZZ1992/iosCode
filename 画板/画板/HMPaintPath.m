//
//  HMPaintPath.m
//  画板
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMPaintPath.h"

@implementation HMPaintPath

+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color startPoint:(CGPoint)startP
{
    HMPaintPath *path = [[self alloc] init];
    
    path.lineWidth = width;
    
    path.color = color;
    [path moveToPoint:startP];
    return path;
}
@end
