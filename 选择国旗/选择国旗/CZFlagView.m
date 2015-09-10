//
//  CZFlagView.m
//  02-选择国旗（UIPickerVIew）
//
//  Created by S.J on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZFlagView.h"
#import "CZFlagModel.h"
@interface CZFlagView()

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@property (weak, nonatomic) IBOutlet UIImageView *iconImg;


@end

@implementation CZFlagView


+ (instancetype)flagView:(UIView *)reusingview
{
    if (reusingview == nil) {
        //如果重利用的view不存在的，就从xib中找到相应合适的view进行创建
        return [[[NSBundle mainBundle]loadNibNamed:@"CZFlagView" owner:self options:nil]lastObject];
    }else{
        //如果重利用的view存在，就直接使用（直接返回）
        return (CZFlagView *)reusingview;
    }
}


+ (CGFloat)viewHigh
{
    return 44;
}


//设置数据
- (void)setModel:(CZFlagModel *)model
{
    self.nameLbl.text = model.name;
    
    self.iconImg.image = [UIImage imageNamed:model.icon];
}


@end
