//
//  HMContact.m
//  私人通讯录
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMContact.h"
#define HMNameKey @"name"
#define HMPhoneKey @"phone"
@implementation HMContact

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:HMNameKey];
    [aCoder encodeObject:_phone forKey:HMPhoneKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:HMNameKey];
        _phone = [aDecoder decodeObjectForKey:HMPhoneKey];
    }
    return self;
}
+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone
{
    HMContact *contact = [[HMContact alloc]init];
    
    contact.name = name;
    contact.phone = phone;
    
    return contact;
}
@end
