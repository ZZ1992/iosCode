//
//  ViewController.m
//  水印
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *oldImage = [UIImage imageNamed:@"002"];
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    NSString *text = @"我要高薪 ！";
    NSDictionary *dict = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:15],
                           NSForegroundColorAttributeName:[UIColor redColor]
                           };
    [text drawAtPoint:CGPointMake(120, 170) withAttributes:dict];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _imageView.image = newImage;
    
    NSData *data = UIImagePNGRepresentation(newImage);
    
    [data writeToFile:@"/Users/yaguangzhu/Desktop/newimage.png" atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
