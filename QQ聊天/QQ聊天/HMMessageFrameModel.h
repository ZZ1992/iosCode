//
//  HMMessageFrameModel.h
//  QQ聊天
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HMMessageModel;
@interface HMMessageFrameModel : NSObject

//时间的frame
@property (nonatomic, assign,readonly)CGRect timeF;

//正文的frame
@property (nonatomic, assign,readonly)CGRect textViewF;

//图片
@property (nonatomic, assign,readonly)CGRect iconF;

//cell
@property (nonatomic, assign)CGFloat cellH;

//数据模型
@property (nonatomic, strong)HMMessageModel *message;

+ (NSArray *)messageFrame;

@end
