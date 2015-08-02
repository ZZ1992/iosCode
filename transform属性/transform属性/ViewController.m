//
//  ViewController.m
//  transform属性
//
//  Created by YaguangZhu on 15/7/29.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnIcon;
- (IBAction)move;

- (IBAction)rotate:(UIButton *)sender;
- (IBAction)scale;
- (IBAction)reset;

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

- (IBAction)move {
    
    //CGAffineTransform  transform =self.btnIcon.transform;
   // self.btnIcon.transform = CGAffineTransformMakeTranslation(0, -50);
    self.btnIcon.transform = CGAffineTransformTranslate(self.btnIcon.transform, 0, 50);
}

- (IBAction)rotate:(UIButton *)sender {
   // self.btnIcon.transform = CGAffineTransformMakeRotation(40);
    self.btnIcon.transform =CGAffineTransformRotate(self.btnIcon.transform, 40);

}

- (IBAction)scale {
    //self.btnIcon.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    [UIView animateWithDuration:2.5 animations:^{
        self.btnIcon.transform = CGAffineTransformScale(self.btnIcon.transform, 1.5, 1.5);
    
     }];
}

- (IBAction)reset {
//    self.btnIcon.transform = CGAffineTransformIdentity;
//    
//    for (UIView *view in  self.view.subviews) {
//        view.backgroundColor = [UIColor redColor];
//    }
//    self.btnIcon.superview.backgroundColor = [UIColor redColor];
    
    while (self.view.subviews.firstObject) {
        [self.view.subviews.firstObject removeFromSuperview];
    }
}

@end
