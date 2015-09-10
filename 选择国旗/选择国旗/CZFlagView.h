//
//  CZFlagView.h
//  02-选择国旗（UIPickerVIew）
//
//  Created by S.J on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZFlagModel;

@interface CZFlagView : UIView

@property (nonatomic, strong)CZFlagModel *model;

+ (instancetype)flagView:(UIView *)reusingview;

+ (CGFloat)viewHigh;

@end
