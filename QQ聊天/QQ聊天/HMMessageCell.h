//
//  HMMessageCell.h
//  QQ聊天
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class HMMessageModel;
@class HMMessageFrameModel;
@interface HMMessageCell : UITableViewCell

+ (instancetype)messageCellWithTableView:(UITableView *)tableview;

//@property(nonatomic,strong) HMMessageModel *messageModel;

// frame 的模型
@property(nonatomic,strong) HMMessageFrameModel *frameModel;



@end
