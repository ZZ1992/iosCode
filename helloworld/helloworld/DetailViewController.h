//
//  DetailViewController.h
//  helloworld
//
//  Created by YaguangZhu on 15/7/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

