//
//  HMAddViewController.h
//  私人通讯录
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMContachTableViewController.h"

@class HMAddViewController,HMContact;
@protocol HMAddViewControllerDelgegate <NSObject>

@optional
- (void)addViewController:(HMAddViewController *)add didAddContact:(HMContact *)contact;

@end


@interface HMAddViewController : UIViewController
@property(nonatomic,strong)HMContachTableViewController *contacts;

@property (nonatomic, weak) id<HMAddViewControllerDelgegate> delegate;
@end
