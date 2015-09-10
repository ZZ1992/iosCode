//
//  HMHeaderView.m
//  QQ好友列表
//
//  Created by YaguangZhu on 15/9/5.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMHeaderView.h"
#import "HMFriendsGroupModel.h"
@interface HMHeaderView ()

@property (nonatomic, weak)UIButton *nameBtn;

@property (nonatomic, weak)UILabel *textLbl;

@end


@implementation HMHeaderView

+ (instancetype)headerViewWith:(UITableView *)tableview
{
    
    static NSString *ID = @"headerView";
    //首先看缓存池中是否存在headerView，如果存在的 直接取出来用
    HMHeaderView *header = [tableview dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (header == nil) {
        //如果不存在   重新创建一个
        header = [[HMHeaderView alloc]initWithReuseIdentifier:ID];
    }
    
    return header;
}

- (void)setGroup:(HMFriendsGroupModel *)group
{
    
    //1. 必须做的操作
    _group = group;
    
    
    [self.nameBtn setTitle:group.name forState:UIControlStateNormal];
    
    //显示在线人数
    self.textLbl.text = [NSString stringWithFormat:@"%d/%d",group.online,group.friends.count];
    
}


//  当headerview 上子控件只需 做一次操作的  或者  要显示出来的    就写在以下方法中
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // Custom  相当  [[UIButton alloc]init];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //btn 上面有一个imageView
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置按钮内容的居左显示
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置按钮的内边距
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置按钮 label 的 内边距
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //按钮内部 imageview 的内边距
        //        btn.imageEdgeInsets
        //居中显示
        btn.imageView.contentMode = UIViewContentModeCenter;
        
        //不予许剪切超出部分
        btn.imageView.clipsToBounds = NO;
        
        
        [btn addTarget:self action:@selector(nameBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        self.nameBtn = btn;
        
        NSLog(@"---------%@",NSStringFromCGRect(self.contentView.frame));
        
        
        UILabel *lable = [[UILabel alloc]init];
        
        //居右显示
        lable.textAlignment = NSTextAlignmentRight;
        
        [self.contentView addSubview:lable];
        
        self.textLbl = lable;
        
    }
    
    
    
    
    return self;
}

/**
 *  当 当前的view 的frame 发生一些改变的时候  调用次方法  重新布局  内部的子控件
 */
- (void)layoutSubviews
{
    self.nameBtn.frame = self.bounds;
    //获取屏幕的宽度
    //    CGFloat screenW = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat lblY = 0;
    CGFloat lblW = 150;
    CGFloat lblh = self.frame.size.height;
    CGFloat lblX = self.frame.size.width - lblW - 10;
    
    self.textLbl.frame = CGRectMake(lblX, lblY, lblW, lblh);
    
}

/**
 *  代理方法
 */
- (void)nameBtnClick
{
    self.group.open = !self.group.open;
    
//        if ([self.delegate respondsToSelector:@selector(headerView:)]) {
//            [self.delegate headerView:self];
//        }
//
//    
//    
//    
//    if (self.block) {
//        self.block(self);
//    }
    
//
   [[NSNotificationCenter defaultCenter] postNotificationName:@"friend" object:self userInfo:nil];
    
    
    
    NSLog(@"----------------");
}



/**
 *  当 当前的view 加载到父控件的时候调用
 */
- (void)didMoveToSuperview
{
    
    //每次当控件加载到父控件的时候都会调用这个方法，包括init 完一次就会调用一次
    if (self.group.open) {
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
        NSLog(@"999999999");
        
    }else{
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}

@end
