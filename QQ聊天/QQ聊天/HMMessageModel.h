//
//  HMMessageModel.h
//  QQ聊天
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    HMMessageModelGatsby =0,
    HMMessageModelJobs
}HMMessageModeltype;

@interface HMMessageModel : NSObject
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *time;
@property(nonatomic,assign) HMMessageModeltype type;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

+ (NSArray *)Messages;

@end
