//
//  CZAppView.m
//  应用管理
//
//  Created by YaguangZhu on 15/8/1.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "CZAppView.h"
#import "app.h"
@interface CZAppView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;

- (IBAction)btnDownloadClick:(UIButton *)sender;

@end
@implementation CZAppView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)appView
{
     NSBundle *rootBoundle = [NSBundle mainBundle];
    return  [[rootBoundle loadNibNamed:@"CZAppView" owner:nil options:nil ] lastObject];
}
- (void)setModel:(app *)model
{
    _model = model;
    
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    self.lblName.text = model.miaoshu;
}

- (IBAction)btnDownloadClick:(UIButton *)sender {
    sender.enabled = NO;
    
    UILabel *lbMsg = [[UILabel alloc]init];
    lbMsg.text= @" downloading.......";
    lbMsg.backgroundColor = [UIColor redColor];
    CGFloat viewW = self.superview.frame.size.width;
    CGFloat viewH = self.superview.frame.size.height;
    CGFloat msgW = 200;
    CGFloat msgH = 20;
    CGFloat msgX =(viewW - msgW)/2;
    CGFloat msgY = (viewH - msgH)*0.5;
    lbMsg.frame = CGRectMake(msgX, msgY, msgW, msgH);
    //颜色
    lbMsg.textColor = [UIColor blackColor];
    //居中
    lbMsg.textAlignment = NSTextAlignmentCenter;
    //粗体
    lbMsg.font = [UIFont boldSystemFontOfSize:17];
    //透明度
    lbMsg.alpha = 0.0;
    //设置圆角
    lbMsg.layer.cornerRadius = 10;
    lbMsg.layer.masksToBounds =YES;
//    [UIView animateWithDuration:1.0 animations:^{
//        lbMsg.alpha = 0.5;
//    }];
    //一个动画结束后 开启另外一个动画 延迟1秒开始
    [UIView animateWithDuration:1.5 animations:^{
        lbMsg.alpha = 0.5;
    } completion:^(BOOL finished) {
        if (finished) {
            [ UIView animateWithDuration:1.5 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
                lbMsg.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [lbMsg removeFromSuperview];
                }
            }];
        }
    }];
    
    [self.superview addSubview:lbMsg];

    
}
@end
