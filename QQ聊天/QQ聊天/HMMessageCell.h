//
//  HMMessageCell.h
//  QQ聊天
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMMessageModel;
@interface HMMessageCell : UITableViewCell

@property(nonatomic,strong) HMMessageModel *messageModel;
@end
