//
//  TgFooterView.h
//  团购网
//
//  Created by YaguangZhu on 15/8/18.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HMTgFooterView;

@protocol HMTgFooterViewDelegate <NSObject>

@optional
/** 视图的下载按钮被点击 */
- (void)tgFooterViewDidDownloadButtonClick:(HMTgFooterView *)footerView;


@end


@interface TgFooterView : UIView
// 代理如果使用强引用，就会产生循环引用，造成控制器和子视图都无法被释放，造成内存泄露
@property (nonatomic, weak) id <HMTgFooterViewDelegate> delegate;


@end
