//
//  HMHeaderView.h
//  QQ好友列表
//
//  Created by YaguangZhu on 15/9/5.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMHeaderView;

typedef void(^HMHeaderViewBlock)(id);


@protocol HMHeaderViewDelegate <NSObject>

@optional
- (void)headerView:(HMHeaderView *)view;



@end

@class HMFriendsGroupModel;
@interface HMHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWith:(UITableView *)tableview;

@property (nonatomic, assign)id<HMHeaderViewDelegate> delegate;


@property (nonatomic, strong)HMFriendsGroupModel *group;


@property (nonatomic, copy)HMHeaderViewBlock block;

@end
