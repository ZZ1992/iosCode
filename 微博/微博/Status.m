//
//  Status.m
//  微博
//
//  Created by YaguangZhu on 15/8/21.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "Status.h"

@implementation Status

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)statuses
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self statusWithDict:dict]];
    }
    
    return arrayM;
}


@end
