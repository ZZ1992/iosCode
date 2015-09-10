//
//  CZFlagModel.m
//  02-选择国旗（UIPickerVIew）
//
//  Created by S.J on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZFlagModel.h"

@implementation CZFlagModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        
        self.icon = dict[@"icon"];
    }
    
    return self;
}

@end
