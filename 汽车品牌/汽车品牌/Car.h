//
//  Car.h
//  汽车品牌
//
//  Created by YaguangZhu on 15/8/16.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carWithDict:(NSDictionary *)dict;
+ (NSArray *)carsWithArray:(NSArray *)array;




@end
