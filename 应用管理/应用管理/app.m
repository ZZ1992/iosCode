//
//  app.m
//  应用管理
//
//  Created by YaguangZhu on 15/7/31.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "app.h"

@implementation app

-(app *)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.miaoshu = dict[@"miaoshu"];
        self.icon = dict[@"icon"];
    }
    return self;
}
+ (app *)appwithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
