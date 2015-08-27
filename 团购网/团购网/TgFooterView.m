//
//  TgFooterView.m
//  团购网
//
//  Created by YaguangZhu on 15/8/18.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "TgFooterView.h"


@interface TgFooterView()

@property (weak, nonatomic) IBOutlet UIButton *loadMoreButon;

@property (weak, nonatomic) IBOutlet UIView *tipsView;



@end
@implementation TgFooterView


- (IBAction)loadmore:(id)sender {
    NSLog(@"ssss");
    self.loadMoreButon.hidden = YES;
    self.tipsView.hidden= NO;

}





@end
