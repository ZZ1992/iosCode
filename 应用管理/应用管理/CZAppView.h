//
//  CZAppView.h
//  应用管理
//
//  Created by YaguangZhu on 15/8/1.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class app;
@interface CZAppView : UIView
@property (nonatomic,strong) app *model;

+ (instancetype)appView;
@end
