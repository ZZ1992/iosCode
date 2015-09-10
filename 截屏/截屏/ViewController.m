//
//  ViewController.m
//  截屏
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *newImage = [UIImage imageWithCaptureView:self.view];
    NSData *data = UIImagePNGRepresentation(newImage);
    
    [data writeToFile:@"/Users/yaguangzhu/Desktop/00d1.png" atomically:YES];

    
}
- (void)CaptureView
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    NSData *data = UIImagePNGRepresentation(newImage);
    
    [data writeToFile:@"/Users/yaguangzhu/Desktop/00d1.png" atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
