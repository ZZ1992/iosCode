//
//  HMLoginViewController.m
//  私人通讯录
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMLoginViewController.h"
#import "MBProgressHUD+MJ.h"
#define HMAccountKey @"account"
#define HMPwdKey @"pwd"
#define HMRmbPwdKey @"rmbPwd"
#define HMAutoLoginKey @"auto_login"
#define HMUserDefaults [NSUserDefaults standardUserDefaults]
@interface HMLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginS;
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwsS;

@end

@implementation HMLoginViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *v =segue.destinationViewController;
    v.navigationItem.title = [NSString stringWithFormat:@"%@的联系人",_accountField.text];
}
- (IBAction)login:(id)sender {
    if ([_accountField.text isEqualToString:@"hm"]&&[_pwdField.text isEqualToString:@"123"]) {
        
        //        UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //        UIViewController *vc = [s instantiateViewControllerWithIdentifier:@"contacts"];
        //        NSLog(@"%@",[vc class]);
        //
        //        [self.navigationController pushViewController:vc animated:YES];
        
        //save login data
//        [HMUserDefaults setObject:_accountField forKey:HMAccountKey];
//        [HMUserDefaults setObject:_pwdField forKey:HMPwdKey];
//        [HMUserDefaults setBool:_rmbPwsS.isOn forKey:HMRmbPwdKey];
//        [HMUserDefaults setBool:_autoLoginS.isOn forKey:HMAutoLoginKey];
//        
//        [HMUserDefaults synchronize];
        
        [MBProgressHUD showMessage:@"正在登录中"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"login2contact" sender:nil];
            [MBProgressHUD hideHUD];
        });
        
    }else
    {
        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"账号密码错误" message:nil delegate:nil  cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        //        [alert show];
        
        [MBProgressHUD showError:@"账号密码错误"];
    }
}

- (IBAction)rmbPwdSwitch:(UISwitch *)sender {
    if (sender.isOn == NO) {
        [_autoLoginS setOn:NO animated:YES];
        // _autoLoginS.on = NO;
    }
}


- (IBAction)autoLoginSwitch:(UISwitch *)sender {
    if (sender.isOn == YES) {
        [_rmbPwsS setOn:YES animated:YES];
        // _autoLoginS.on = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    //read data from "sha he"
    
//    _accountField.text = [HMUserDefaults objectForKey:HMAccountKey];
//    _pwdField.text = [HMUserDefaults objectForKey:HMPwdKey];
//    _rmbPwsS.on = [HMUserDefaults boolForKey:HMRmbPwdKey];
//    _autoLoginS.on = [HMUserDefaults boolForKey:HMAutoLoginKey];
    
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
    
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
    NSLog(@"%@",_accountField.text);
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
