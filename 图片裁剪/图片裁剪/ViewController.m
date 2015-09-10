//
//  ViewController.m
//  图片裁剪
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+UItool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   //白色圆环版
    _ImageView.image = [UIImage imageWithName:@"001" border:10 borderColor:[UIColor redColor]];
    
    
}
- (void)clipCrile
{
    CGFloat borderW = 5;
    UIImage *oldImage = [UIImage imageNamed:@"001"];
    CGFloat imageW = oldImage.size.width + 2 * borderW;
    CGFloat imageH = oldImage.size.height+ 2 * borderW;
    
    CGFloat circirW = imageW > imageH ? imageH :imageW;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circirW, circirW), NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circirW, circirW)];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(ctx, path.CGPath);
    [[UIColor whiteColor]set];
    
    CGContextFillPath(ctx);
    CGRect clipR = CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height);
    
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipR];
    
    [clipPath addClip];
    
    [oldImage drawAtPoint:CGPointMake(borderW, borderW)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    _ImageView.image = newImage;

}
- (void)clip
{
    UIImage *oldImage = [UIImage imageNamed:@"001"];
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, oldImage.size.width, oldImage.size.height)];
    [path addClip];
    
    [oldImage drawAtPoint:CGPointZero];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _ImageView.image = newImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
