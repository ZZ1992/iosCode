//
//  Tg.h
//  团购网
//
//  Created by YaguangZhu on 15/8/18.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tg : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,copy) NSString *buyCount;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgWithDict:(NSDictionary *)dict;
+ (NSArray *)tgs;

@end
