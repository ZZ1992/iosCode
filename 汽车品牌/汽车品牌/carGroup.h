//
//  carGroup.h
//  汽车品牌
//
//  Created by YaguangZhu on 15/8/16.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface carGroup : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carGroupWithDict:(NSDictionary *)dict;
+ (NSArray *)carGroups1;

@end
