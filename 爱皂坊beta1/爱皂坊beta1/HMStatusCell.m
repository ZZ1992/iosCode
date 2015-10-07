//
//  HMStatusCell.m
//  新浪微博
//
//  Created by YaguangZhu on 15/8/26.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMStatusCell.h"
#import "HMStatus.h"
/** 姓名字体 */
#define kNameFont   [UIFont systemFontOfSize:14]
/** 正文字体 */
#define kTextFont   [UIFont systemFontOfSize:16]

@interface HMStatusCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameView;
@property (nonatomic, strong) UIImageView *vipView;
@property (nonatomic, strong) UILabel *textView;
@property (nonatomic, strong) UIImageView *pictureView;
@property (nonatomic, strong) UITextField *weightView;
@property (nonatomic, strong) UITextField *percentView;
@property (nonatomic, strong) UILabel *lblweightView;
@property (nonatomic, strong) UILabel *lblpercentView;

@end

@implementation HMStatusCell


- (UIImageView *)iconView
{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
    }
    return _iconView;
}

- (UILabel *)nameView
{
    if (_nameView == nil) {
        _nameView = [[UILabel alloc] init];
        // 默认字体是17号
        _nameView.font = kNameFont;
        [self.contentView addSubview:_nameView];
    }
    return _nameView;
}

- (UIImageView *)vipView
{
    if (_vipView == nil) {
        _vipView = [[UIImageView alloc] init];
        _vipView.image = [UIImage imageNamed:@"vip"];
        _vipView.hidden = YES;
        
        [self.contentView addSubview:_vipView];
    }
    return _vipView;
}

- (UILabel *)textView
{
    if (_textView == nil) {
        _textView = [[UILabel alloc] init];
        _textView.font = kTextFont;
        _textView.numberOfLines = 0;
        
        [self.contentView addSubview:_textView];
    }
    return _textView;
}

- (UIImageView *)pictureView
{
    if (_pictureView == nil) {
        _pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}
- (UITextField *)weightView
{
    if (_weightView == nil) {
        _weightView = [[UITextField alloc]init];
       
        [self.contentView addSubview:_weightView];
           }
    return _weightView;
}

- (UITextField *)percentView
{
    if (_percentView == nil) {
        _percentView = [[UITextField alloc]init];
        _percentView.placeholder = @"油比（％）";
        [self.contentView addSubview:_percentView];
    }
    return _percentView;
}

- (UILabel *)lblweightView
{
    if (_lblweightView == nil) {
        _lblweightView = [[UILabel alloc]init];
        [self.contentView addSubview:_lblweightView];
    }
    return _lblweightView;
}

- (UILabel *)lblpercentView
{
    if (_lblpercentView == nil) {
        _lblpercentView = [[UILabel alloc]init];
        [self.contentView addSubview:_lblpercentView];
    }
    return _lblpercentView;
}


- (void)setStatus:(HMStatus *)status
{
    _status = status;
    
    // 1> 设置数据
    [self settingData];
    
    // 2> 设置位置
    [self settingFrame];
}

- (void)settingData
{
    // 头像
    self.iconView.image = [UIImage imageNamed:self.status.icon];
    // 姓名
    self.nameView.text = self.status.name;
    // vip(可选的)
    if (self.status.vip) {
        self.vipView.hidden = NO;
        self.nameView.textColor = [UIColor redColor];
    } else {
        self.vipView.hidden = YES;
        self.nameView.textColor = [UIColor blackColor];
    }
    
    // 正文
    self.textView.text = self.status.text;
    
   self.weightView.text = [NSString stringWithFormat:@"%@",self.status.weight];
    [self.weightView setBorderStyle:UITextBorderStyleRoundedRect];
    self.weightView.placeholder = @"油重";
    self.percentView.text = [NSString stringWithFormat:@"%@",self.status.percent];
    [self.percentView setBorderStyle:UITextBorderStyleRoundedRect];
    self.percentView.placeholder = @"油比";
    self.lblweightView.text = @"kg";
    self.lblpercentView.text=@"%";
    
    // 配图(可选参数)
    // imageNamed:nil CUICatalog: Invalid asset name supplied: (null), or invalid scale factor: 2.000000
    if (self.status.picture.length > 0) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:self.status.picture];
    } else {
        self.pictureView.hidden = YES;
    }
}

- (void)settingFrame
{
    // 0. 定义间距
    CGFloat padding = 10;
    
    // 1. 头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2. 姓名大小由文字的长度来决定
    // boundingRectWithSize计算给定文本字符串所占的区域
    // 返回值是一个x,y = 0的CGRect,w,h是计算好的宽高
    //
    // 如果要计算多行的准确高度，需要传入NSStringDrawingUsesLineFragmentOrigin选项
    // dict用于指定字体的相关属性的字典，UIKit框架中的第一个头文件
    // context: nil
    NSDictionary *nameDict = @{NSFontAttributeName: kNameFont};
    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    nameFrame.origin.x = CGRectGetMaxX(self.iconView.frame) + padding;
    nameFrame.origin.y = padding + (self.iconView.bounds.size.height - nameFrame.size.height) * 0.5;
    self.nameView.frame = nameFrame;
    
    // vip图标
    CGFloat vipX = CGRectGetMaxX(self.nameView.frame) + padding;
    CGFloat vipY = self.nameView.frame.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    self.vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    
    CGFloat weightX = padding;
    CGFloat weightY = CGRectGetMaxY(self.iconView.frame)+ padding;;
    CGFloat weightW = 150;
    CGFloat weightH = 30;
    self.weightView.frame = CGRectMake(weightX, weightY, weightW, weightH);
    
    CGFloat lblweightX = CGRectGetMidX(self.weightView.frame)+padding;
    CGFloat lblweightY = CGRectGetMaxY(self.iconView.frame)+ padding;;
    CGFloat lblweightW = 150;
    CGFloat lblweightH = 30;
    self.lblweightView.frame = CGRectMake(lblweightX, lblweightY, lblweightW, lblweightH);
    
    CGFloat percentX = padding;
    CGFloat percentY = CGRectGetMaxY(self.weightView.frame)+ padding;;
    CGFloat percentW = 150;
    CGFloat percentH = 30;
    self.percentView.frame = CGRectMake(percentX, percentY, percentW, percentH);
    
    CGFloat lblpercentX = CGRectGetMidX(self.percentView.frame)+padding;
    CGFloat lblpercentY = CGRectGetMaxY(self.weightView.frame)+ padding;;
    CGFloat lblpercentW = 150;
    CGFloat lblpercentH = 30;
    self.lblpercentView.frame = CGRectMake(lblpercentX, lblpercentY, lblpercentW, lblpercentH);

    
//    // 正文
//    NSDictionary *textDict = @{NSFontAttributeName: kTextFont};
//    CGRect textFrame = [self.status.text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
//    textFrame.origin.x = padding;
//    textFrame.origin.y = CGRectGetMaxY(self.iconView.frame) + padding;
//    self.textView.frame = textFrame;
//    
//    CGFloat cellHeight;
//    
//    if (self.status.picture.length > 0) {
//        // 配图
//        CGFloat pictureX = padding;
//        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
//        CGFloat pictureW = 100;
//        CGFloat pictureH = 100;
//        self.pictureView.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
//        
//        cellHeight = CGRectGetMaxY(self.pictureView.frame) + padding;
//    } else {
//        cellHeight = CGRectGetMaxY(self.textView.frame) + padding;
//    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
