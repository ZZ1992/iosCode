//
//  StatusFrame.h
//  新浪微博
//
//  Created by YaguangZhu on 15/8/26.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HMStatus;


@interface StatusFrame : NSObject

@property (nonatomic, assign) CGRect iconf;
@property (nonatomic, assign) CGRect namef;
@property (nonatomic, assign) CGRect vipf;
@property (nonatomic, assign) CGRect textf;
@property (nonatomic, assign) CGRect picturef;

/** 行高 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 所有控件的尺寸都可以通过Status来计算得出 */
@property (nonatomic, strong) HMStatus *status;

/** 所有的statusFrame数据数组 */
+ (NSArray *)statusFrames;

@end
