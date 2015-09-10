//
//  CZFlagModel.h
//  02-选择国旗（UIPickerVIew）
//
//  Created by S.J on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZFlagModel : NSObject

@property (nonatomic, copy)NSString *name;

@property (nonatomic, copy)NSString *icon;


- (instancetype)initWithDict:(NSDictionary *)dict;

@end
