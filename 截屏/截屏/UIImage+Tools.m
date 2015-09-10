//
//  UIImage+Tools.m
//  截屏
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "UIImage+Tools.h"

@implementation UIImage (Tools)

+ (instancetype)imageWithCaptureView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
