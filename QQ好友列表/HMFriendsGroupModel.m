//
//  HMFriendsGroupModel.m
//  QQ好友列表
//
//  Created by YaguangZhu on 15/9/1.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMFriendsGroupModel.h"
#import "HMFriendsModel.h"
@implementation HMFriendsGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    
    if (self = [super init]) {
        //注入所有值
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            HMFriendsModel *model = [HMFriendsModel friendsWithDict:dict];
            
            [arr addObject:model];
            
        }
        
        self.friends = arr;
        
    }
    return self;
    
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dict];
//    }
//    return self;
}

+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

//+ (NSArray *)friendsModel
//{
//    HMFriendsGroupModel *model =[[HMFriendsGroupModel alloc]init];
//    NSMutableArray *arrayM = [NSMutableArray array];
//    
//            for (NSDictionary *dict in model.friends) {
//                HMFriendsModel *model = [HMFriendsModel friendsWithDict:dict];
//    
//                [arrayM addObject:model];
//            }
//    model.friends =arrayM;
//    
//    return arrayM;
//}


@end
