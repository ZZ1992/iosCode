//
//  ViewController.m
//  02加法计算器
//
//  Created by YaguangZhu on 15/7/28.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)jisuan;
@property (weak, nonatomic) IBOutlet UITextField *txtNum1;
@property (weak, nonatomic) IBOutlet UITextField *txtNum2;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;


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





- (IBAction)jisuan {
    NSString *num1 = self.txtNum1.text;
    NSString *num2 = self.txtNum2.text;
    int n1 = num1.intValue;
    int n2 = num2.intValue;
    int result = n1+n2;
    self.lblResult.text = [NSString stringWithFormat:@"%d",result];
    //[self.txtNum2 resignFirstResponder];
    //[self.txtNum1 resignFirstResponder];
    [self.view endEditing:YES];
    

}
@end
