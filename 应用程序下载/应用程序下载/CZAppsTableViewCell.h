//
//  CZAppsTableViewCell.h
//  应用程序下载
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJApp;
@interface CZAppsTableViewCell : UITableViewCell

@property (nonatomic,strong)MJApp *apps;
+ (instancetype)appsTableviewCellwithTableview:(UITableView *)tableview;
@end
