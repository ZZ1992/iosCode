//
//  ViewController.m
//  MovePicture
//
//  Created by YaguangZhu on 15/7/28.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)move:(UIButton *)sender;

- (IBAction)scale:(UIButton *)sender;



@property (weak, nonatomic) IBOutlet UIButton *btnIcon;

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


- (IBAction)move:(UIButton *)sender {
    
    CGPoint centerPoint =  self.btnIcon.center;
    
    switch (sender.tag) {
        case 10:
            NSLog(@"up");
            centerPoint.y -=10;
            break;
        case 20:
            NSLog(@"right");
            centerPoint.x +=10;
            break;
        case 30:
            NSLog(@"down");
            centerPoint.y +=10;
            break;
        case 40:
            NSLog(@"left");
            centerPoint.x -=10;
            break;
        default:
            break;
    
    }
    
    [UIView animateWithDuration:1.0
animations:^{
    self.btnIcon.center = centerPoint;
}];
}

- (IBAction)scale:(UIButton *)sender {
    
    CGRect originBounds = self.btnIcon.bounds;
    if (sender.tag == 100) {
         NSLog(@"big");
        originBounds.size.height +=10;
        originBounds.size.width +=10;
        
        self.btnIcon.bounds = originBounds;
    }else
    {    NSLog(@"small");
        originBounds.size.height -=10;
        originBounds.size.width -=10;
        
        self.btnIcon.bounds = originBounds;

    }
    
    [UIView beginAnimations:nil context:(nil)];
    [UIView setAnimationDuration:2];
    self.btnIcon.bounds = originBounds;
    [UIView commitAnimations];

}


@end
