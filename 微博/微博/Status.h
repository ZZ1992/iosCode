//
//  Status.h
//  微博
//
//  Created by YaguangZhu on 15/8/21.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *picture;
@property(nonatomic,assign) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)statusWithDict:(NSDictionary *)dict;
+ (NSArray *)statuses;

@end
