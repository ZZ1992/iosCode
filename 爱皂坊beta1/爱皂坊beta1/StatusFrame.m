//
//  StatusFrame.m
//  新浪微博
//
//  Created by YaguangZhu on 15/8/26.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "StatusFrame.h"
#import "HMStatus.h"

/** 姓名字体 */
#define kNameFont   [UIFont systemFontOfSize:14]
/** 正文字体 */
#define kTextFont   [UIFont systemFontOfSize:16]
@implementation StatusFrame

-(void)setStatus:(HMStatus *)status
{
    _status = status;
    
    // 0. 定义间距
    CGFloat padding = 10;
    
    // 1. 头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    self.iconf = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2. 姓名大小由文字的长度来决定
    // boundingRectWithSize计算给定文本字符串所占的区域
    // 返回值是一个x,y = 0的CGRect,w,h是计算好的宽高
    //
    // 如果要计算多行的准确高度，需要传入NSStringDrawingUsesLineFragmentOrigin选项
    // dict用于指定字体的相关属性的字典，UIKit框架中的第一个头文件
    // context: nil
    NSDictionary *nameDict = @{NSFontAttributeName: kNameFont};
    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    nameFrame.origin.x = CGRectGetMaxX(self.iconf) + padding;
    nameFrame.origin.y = padding + (self.iconf.size.height - nameFrame.size.height) * 0.5;
    self.namef = nameFrame;
    
    // vip图标
    CGFloat vipX = CGRectGetMaxX(self.namef) + padding;
    CGFloat vipY = self.namef.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    self.vipf = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 正文
    NSDictionary *textDict = @{NSFontAttributeName: kTextFont};
    CGRect textFrame = [self.status.text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(self.iconf) + padding;
    self.textf = textFrame;
    
    //CGFloat cellHeight;
    
    if (self.status.picture.length > 0) {
        // 配图
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        self.picturef = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        self.cellHeight = CGRectGetMaxY(self.picturef) + padding;
    } else {
        self.cellHeight = CGRectGetMaxY(self.textf) + padding;
    }

}

+ (NSArray *)statusFrames
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        // 要添加statusFrame对象
        StatusFrame *statusFrame = [[StatusFrame alloc] init];
        
        // 实例化一个新的Status模型
        HMStatus *status = [HMStatus statusWithDict:dict];
        
        // 调用自己的setter方法，保存status数据模型，同时计算出所有控件的位置
        statusFrame.status = status;
        
        // 将statusFrame添加到数组
        [arrayM addObject:statusFrame];
    }
    
    return arrayM;
}


@end
