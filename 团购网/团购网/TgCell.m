//
//  TgCell.m
//  团购网
//
//  Created by YaguangZhu on 15/8/18.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "TgCell.h"
#import "Tg.h"
@interface TgCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation TgCell

+ (instancetype)cellWithtableview:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    TgCell *cell1 = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (cell1 == nil) {
        //cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        //从xib里面加载自定义视图
        cell1 = [[[NSBundle mainBundle] loadNibNamed:@"TgCell" owner:nil options:nil] lastObject];
    }
    
    return cell1;

}
- (void)setTg:(Tg *)tg
{
    _tg = tg;
    
    self.titleLabel.text = tg.title;
    self.imageView.image = [UIImage imageNamed:tg.icon];
    self.priceLabel.text = tg.price;
    self.buyCountLabel.text = tg.buyCount;

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
