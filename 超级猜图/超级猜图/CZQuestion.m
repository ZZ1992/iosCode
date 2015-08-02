//
//  CZQuestion.m
//  超级猜图
//
//  Created by YaguangZhu on 15/8/2.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "CZQuestion.h"

@implementation CZQuestion
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.answer = dict[@"answer"];
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.options = dict[@"options"];
    }
    return self;
}
+ (instancetype)questionWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
