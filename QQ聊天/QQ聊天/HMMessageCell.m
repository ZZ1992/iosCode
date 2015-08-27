//
//  HMMessageCell.m
//  QQ聊天
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMMessageCell.h"
#import "HMMessageModel.h"

/** 姓名字体 */
#define kNameFont   [UIFont systemFontOfSize:14]
/** 正文字体 */
#define kTextFont   [UIFont systemFontOfSize:16]

@interface HMMessageCell()
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UILabel *textView;
@property(nonatomic,strong)UIImageView *icon;
@end
@implementation HMMessageCell


- (UILabel *)time
{
    if (_time ==nil) {
        _time = [[UILabel alloc]init];
        [self.contentView addSubview:_time];
    }
    return _time;
}

- (UILabel *)textView
{
    if (_textView == nil) {
        _textView = [[UILabel alloc]init];
        [self.contentView addSubview:_textView];

    }
    return _textView;
}

- (UIImageView *)icon
{
    if (_icon ==nil) {
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

- (void)setMessageModel:(HMMessageModel *)messageModel
{
    _messageModel = messageModel;
    
    [self settingData];
    [self settingFrame];
}

- (void)settingData
{
    self.time.text = self.messageModel.time;
    self.textView.text = self.messageModel.text;
    
   
}

- (void)settingFrame
{
  
    
    
       self.time.frame = CGRectMake(100, 10, 100, 50);
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
