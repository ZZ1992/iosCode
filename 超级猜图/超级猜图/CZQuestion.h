//
//  CZQuestion.h
//  超级猜图
//
//  Created by YaguangZhu on 15/8/2.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZQuestion : NSObject
@property(nonatomic,copy)NSString *answer;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) NSArray *options;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)questionWithDict:(NSDictionary*)dict;
@end
