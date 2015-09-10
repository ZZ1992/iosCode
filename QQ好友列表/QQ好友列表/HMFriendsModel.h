//
//  HMFriendsModel.h
//  QQ好友列表
//
//  Created by YaguangZhu on 15/9/1.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMFriendsModel : NSObject


@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *icon;

@property(nonatomic,copy) NSString *intro;

@property(nonatomic,assign,getter=isVip) BOOL vip ;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsWithDict:(NSDictionary *)dict;
//+ (NSArray *)friends;

@end
