//
//  HMFriendsGroupModel.h
//  QQ好友列表
//
//  Created by YaguangZhu on 15/9/1.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMFriendsGroupModel : NSObject

@property(nonatomic,strong) NSArray *friends;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) BOOL open;

@property(nonatomic,assign) int online;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict;
//+ (NSArray *)friendsModel;

@end
