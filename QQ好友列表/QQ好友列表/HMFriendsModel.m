//
//  HMFriendsModel.m
//  QQ好友列表
//
//  Created by YaguangZhu on 15/9/1.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMFriendsModel.h"

@implementation HMFriendsModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

//+ (NSArray *)friends
//{
//    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
//    NSMutableArray *arrayM = [NSMutableArray array];
//    for (NSDictionary *dict in array) {
//        [arrayM addObject:[self friendsWithDict:dict]];
//    }
//    
//    return arrayM;
//}

@end
