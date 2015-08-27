//
//  Tg.m
//  团购网
//
//  Created by YaguangZhu on 15/8/18.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "Tg.h"

@implementation Tg

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tgWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)tgs
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self tgWithDict:dict]];
    }
    
    return arrayM;
}

@end
