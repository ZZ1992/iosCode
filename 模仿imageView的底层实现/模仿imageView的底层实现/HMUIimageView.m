//
//  HMUIimageView.m
//  模仿imageView的底层实现
//
//  Created by YaguangZhu on 15/9/9.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMUIimageView.h"

@implementation HMUIimageView



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // Drawing code
    [_image drawInRect:rect];
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self setNeedsDisplay];
}
@end
