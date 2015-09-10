//
//  HMPaintView.h
//  画板
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMPaintView : UIView

@property(nonatomic,assign)CGFloat width;

@property(nonatomic,strong)UIColor *color;

@property(nonatomic,strong)UIImage *image;

- (void)clearScreen;

- (void)undo;



@end
