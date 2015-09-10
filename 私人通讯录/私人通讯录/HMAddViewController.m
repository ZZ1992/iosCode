//
//  HMAddViewController.m
//  私人通讯录
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMAddViewController.h"
#import "HMContachTableViewController.h"
#import "HMContact.h"


@interface HMAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation HMAddViewController
- (IBAction)add:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    
   // [self.contacts setName:_nameField phone:_phoneField];
    HMContact *contact = [HMContact contactWithName:_nameField.text phone:_phoneField.text];
    // 2.通知代理做事情
    if ([_delegate respondsToSelector:@selector(addViewController:didAddContact:)]) {
        [_delegate addViewController:self didAddContact:contact];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self textChange];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    //_accountField.delegate = self;
    
}

- (void)textChange
{
    //    if (_pwdField.text.length && _accountField.text.length ) {
    //        _loginBtn.enabled = YES;
    //    }
    //    else
    //    {
    //        _loginBtn.enabled = NO;
    //    }
    
    _addBtn.enabled = _nameField.text.length && _phoneField.text.length;
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
