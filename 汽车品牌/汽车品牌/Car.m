//
//  Car.m
//  汽车品牌
//
//  Created by YaguangZhu on 15/8/16.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)carsWithArray:(NSArray *)array
{
    //NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self carWithDict:dict]];
    }
    
    return arrayM;
}

@end
