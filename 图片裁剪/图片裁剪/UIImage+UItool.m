//
//  UIImage+UItool.m
//  图片裁剪
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "UIImage+UItool.h"

@implementation UIImage (UItool)
+ (instancetype)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color
{
    CGFloat borderW = border;
    UIImage *oldImage = [UIImage imageNamed:name];
    CGFloat imageW = oldImage.size.width + 2 * borderW;
    CGFloat imageH = oldImage.size.height+ 2 * borderW;
    
    CGFloat circirW = imageW > imageH ? imageH :imageW;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circirW, circirW), NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circirW, circirW)];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(ctx, path.CGPath);
    [color set];
    
    CGContextFillPath(ctx);
    
    CGRect clipR = CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height);
    
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipR];
    
    [clipPath addClip];
    
    [oldImage drawAtPoint:CGPointMake(borderW, borderW)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}
@end
