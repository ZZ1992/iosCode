//
//  HMContact.h
//  私人通讯录
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMContact : NSObject<NSCoding>

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *phone;

+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone;

@end
