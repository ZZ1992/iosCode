//
//  HMView.m
//  UIKit练习
//
//  Created by YaguangZhu on 15/9/9.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMView.h"

@implementation HMView
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"jiangxin"];
    // 裁剪区域，外面都不显示
    UIRectClip(CGRectMake(0, 0, 100, 100));
   // [image drawAtPoint:CGPointZero];
    [image drawAsPatternInRect:rect];
}

- (void)drawText
{
    NSString *text = @"sdddfffffffffffffgrgijperwpjprthrjtjreptrhkrht";
    CGRect textFrame = CGRectMake(0, 0, 250, 250);
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:20],
                           NSForegroundColorAttributeName:[UIColor redColor],
                           NSStrokeWidthAttributeName:@5
                           };
    UIRectFill(textFrame);
    //不会换行
    //[text drawAtPoint:CGPointZero withAttributes:dict];
    [text drawInRect:textFrame withAttributes:dict];
}
@end
