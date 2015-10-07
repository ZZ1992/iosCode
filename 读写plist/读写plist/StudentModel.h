//
//  StudentModel.h
//  
//
//  Created by YaguangZhu on 15/10/5.
//
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *age;
@property(nonatomic,copy) NSString *number;
@property(nonatomic,copy) NSString *nation;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)studentWithDict:(NSDictionary *)dict;
+ (NSArray *)studentes;
@end
