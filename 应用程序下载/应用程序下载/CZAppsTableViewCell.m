//
//  CZAppsTableViewCell.m
//  应用程序下载
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "CZAppsTableViewCell.h"
#import "MJApp.h"
@interface CZAppsTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@property (weak, nonatomic) IBOutlet UILabel *introLbl;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;

- (IBAction)downloadClick:(id)sender;


@end
@implementation CZAppsTableViewCell

+ (instancetype)appsTableviewCellwithTableview:(UITableView *)tableview
{
    return [tableview dequeueReusableCellWithIdentifier:@"apps"];
}



- (void)setApps:(MJApp *)apps
{
    _apps = apps;
    self.nameLbl.text = apps.name;

    self.imageView.image = [UIImage imageNamed:apps.icon];
    self.introLbl.text = [NSString stringWithFormat:@"%@|%@",apps.size,apps.download];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)downloadClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.enabled = NO;
    
    self.apps.downloaded = YES;
}
@end
