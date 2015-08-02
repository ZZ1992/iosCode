//
//  app.h
//  应用管理
//
//  Created by YaguangZhu on 15/7/31.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface app : NSObject

@property (nonatomic,copy) NSString *miaoshu;
@property (nonatomic,copy) NSString *icon;

- (app *)initWithDict:(NSDictionary *)dict;
+ (app *)appwithDict:(NSDictionary *)dict;

@end
