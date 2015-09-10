//
//  HMPaintPath.h
//  画板
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMPaintPath : UIBezierPath

@property(nonatomic,strong)UIColor *color;



+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color startPoint:(CGPoint)startP;
@end
