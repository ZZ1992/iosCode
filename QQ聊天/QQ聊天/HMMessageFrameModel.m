//
//  HMMessageFrameModel.m
//  QQ聊天
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMMessageFrameModel.h"
#import "HMMessageModel.h"
#import "Constant.h"

@implementation HMMessageFrameModel

- (void)setMessage:(HMMessageModel *)message
{
    _message = message;
    
    CGFloat padding = 10;
    if (message.hideTime ==NO) {
        //1. 时间
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = bScreenWidth;
        CGFloat timeH = bNormalH;
        
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);

    }
    
    //2.头像
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeF);
    CGFloat iconW = bIconW;
    CGFloat iconH = bIconH;
    
    if (message.type == HMMessageModelGatsby) {//自己发的
        
        iconX = bScreenWidth - iconW - padding;
        
    }else{//别人发的
        iconX = padding;
    }
    
    _iconF =  CGRectMake(iconX, iconY, iconW, iconH);
    //3.正文
    
    CGFloat textX;
    CGFloat textY = iconY+padding;
    
    CGSize textMaxSize = CGSizeMake(150, MAXFLOAT);
    CGSize textRealSize = [message.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:bBtnFont} context:nil].size;
    
    CGSize btnSize = CGSizeMake(textRealSize.width+40, textRealSize.height+40);
    if (message.type == HMMessageModelGatsby) {
        textX = bScreenWidth - iconW - padding*2 - btnSize.width;
    }else{
        textX = padding + iconW;
    }
    
    //    _textViewF = CGRectMake(textX, textY, <#CGFloat width#>, <#CGFloat height#>)
    _textViewF = (CGRect){{textX,textY},btnSize};
    
    //4.cell高度
    
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    CGFloat textMaxY = CGRectGetMaxY(_textViewF);
    
    _cellH = MAX(iconMaxY, textMaxY);
}


+ (NSArray *)messageFrame
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        // 要添加statusFrame对象
        HMMessageFrameModel *frameModel = [[HMMessageFrameModel alloc] init];
        
        // 实例化一个新的Status模型
        HMMessageModel *messageModel = [HMMessageModel messageWithDict:dict];
        
        HMMessageFrameModel *lastModel = [arrayM lastObject];
        
        messageModel.hideTime = [messageModel.time isEqualToString:lastModel.message.time];
        
        // 调用自己的setter方法，保存status数据模型，同时计算出所有控件的位置
        frameModel.message = messageModel;
        
        // 将statusFrame添加到数组
        [arrayM addObject:frameModel];
    }
    
    return arrayM;
}
@end
