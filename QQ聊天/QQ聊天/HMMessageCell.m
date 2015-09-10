//
//  HMMessageCell.m
//  QQ聊天
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMMessageCell.h"
#import "HMMessageModel.h"
#import "HMMessageFrameModel.h"
#import "Constant.h"
#import "UIImage+resizeImage.h"

/** 姓名字体 */
#define kNameFont   [UIFont systemFontOfSize:14]
/** 正文字体 */
#define kTextFont   [UIFont systemFontOfSize:16]

@interface HMMessageCell()
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UIButton *textView;
@property(nonatomic,strong)UIImageView *icon;
@end
@implementation HMMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:nil reuseIdentifier:nil];
    self.backgroundColor = [UIColor clearColor];
    
    return self;
}

+ (instancetype)messageCellWithTableView:(UITableView *)tableview
{
    static NSString *ID = @"messageCell";
    HMMessageCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

- (UILabel *)time
{
    if (_time ==nil) {
        _time = [[UILabel alloc]init];
        _time.textAlignment = NSTextAlignmentCenter;
        _time.font = [UIFont systemFontOfSize:13.0f];
        [self.contentView addSubview:_time];
    }
    return _time;
}

- (UIButton *)textView
{
    if (_textView == nil) {
        _textView = [[UIButton alloc]init];
        //_textView.backgroundColor = [UIColor grayColor];
        _textView.titleLabel.font = bBtnFont;
        _textView.titleLabel.numberOfLines = 0;//自动换行
        _textView.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        [_textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
//可以通过数据模型来设置数据和位置，也可以通过位置模型来设置数据和位置


- (void)setFrameModel:(HMMessageFrameModel *)frameModel
{
    _frameModel = frameModel;
    
    HMMessageModel *messageModel = frameModel.message;
    
    //1.时间
    self.time.frame = frameModel.timeF;
    self.time.text = messageModel.time;
    
    //2.头像
    self.icon.frame = frameModel.iconF;
    if (messageModel.type == HMMessageModelGatsby) {
        self.icon.image = [UIImage imageNamed:@"Gatsby"];
    }else{
        self.icon.image = [UIImage imageNamed:@"Jobs"];
    }
    
    //3.正文
    self.textView.frame = frameModel.textViewF;
    [self.textView setTitle:messageModel.text forState:UIControlStateNormal];
    
  
    
    if (messageModel.type == HMMessageModelGatsby) {
        [self.textView setBackgroundImage:[UIImage resizeWithImageName:@"chat_send_nor"] forState:UIControlStateNormal];
    }else
    {
         [self.textView setBackgroundImage:[UIImage resizeWithImageName:@"chat_recive_nor"] forState:UIControlStateNormal];
    }
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
