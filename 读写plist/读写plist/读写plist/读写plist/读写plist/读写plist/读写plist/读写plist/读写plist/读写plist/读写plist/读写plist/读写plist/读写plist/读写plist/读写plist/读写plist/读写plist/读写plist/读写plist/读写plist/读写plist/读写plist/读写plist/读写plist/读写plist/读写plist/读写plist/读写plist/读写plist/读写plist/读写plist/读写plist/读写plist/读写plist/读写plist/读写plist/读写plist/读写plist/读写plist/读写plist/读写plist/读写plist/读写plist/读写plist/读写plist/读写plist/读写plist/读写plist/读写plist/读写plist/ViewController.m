//
//  ViewController.m
//  读写plist
//
//  Created by YaguangZhu on 15/10/4.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "SaveStudentMessagePlist.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *studentNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *studentnationTextField;
@property (weak, nonatomic) IBOutlet UITextField *studentAgeTextFIeld;

@end

@implementation ViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if (![self.studentNumberTextField.text isEqualToString:@"" ])
    {
        SaveStudentMessagePlist *save = [[SaveStudentMessagePlist  alloc]initWithStudentName:_studentNameTextField.text Studentage:_studentAgeTextFIeld.text StudentNumber:_studentNumberTextField.text StudentNation:_studentnationTextField.text];
        
    }
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
