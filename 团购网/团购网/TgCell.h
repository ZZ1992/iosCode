//
//  TgCell.h
//  团购网
//
//  Created by YaguangZhu on 15/8/18.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tg;
@interface TgCell : UITableViewCell



@property(nonatomic,strong) Tg *tg;

+ (instancetype)cellWithtableview:(UITableView *)tableView;

@end 
