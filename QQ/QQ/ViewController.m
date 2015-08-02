//
//  ViewController.m
//  QQ
//
//  Created by YaguangZhu on 15/7/29.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)login;
@property (weak, nonatomic) IBOutlet UITextField *txtQQ;
@property (weak, nonatomic) IBOutlet UITextField *txtPwd;

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

- (IBAction)login {
    NSString *qq = self.txtQQ.text;
    NSString *pwd = self.txtPwd.text;
    NSLog(@"%@,%@",qq,pwd);
    //[self.view.endEditing:YES];
}
@end
