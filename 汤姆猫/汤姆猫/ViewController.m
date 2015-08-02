//
//  ViewController.m
//  汤姆猫
//
//  Created by YaguangZhu on 15/7/30.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)drink;
@property (weak, nonatomic) IBOutlet UIImageView *imgCat;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drink {
    
    //如果当前在执行动画 这按钮实效
    if (self.imgCat.isAnimating) {
        return;
    }
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 1; i<=11; i++) {
        NSString *imgName = [NSString stringWithFormat:@"%02d.png",i];
        //太耗内存了，换一种方法
        UIImage *imageCat = [UIImage imageNamed:imgName];
       // NSString *path = [[NSBundle mainBundle] pathForResource:imgName ofType:nil];
        //UIImage *imageCat = [UIImage imageWithContentsOfFile:path];
        [arrayM addObject:imageCat];
        
       
    }
    self.imgCat.animationImages =arrayM;
    
    self.imgCat.animationDuration = self.imgCat.animationImages.count*1;
    [self.imgCat startAnimating];
    
    //为了节省内存 让动画执行完 延迟执行
    [self.imgCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imgCat.animationImages.count*1];
    
}
@end
