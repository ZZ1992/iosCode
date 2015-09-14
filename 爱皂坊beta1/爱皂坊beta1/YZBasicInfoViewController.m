//
//  YZBasicInfoViewController.m
//  爱皂坊beta1
//
//  Created by YaguangZhu on 15/9/13.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "YZBasicInfoViewController.h"

@interface YZBasicInfoViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *soapNameField;
@property (weak, nonatomic) IBOutlet UITextField *waterPercentField;
@property (weak, nonatomic) IBOutlet UITextField *waterWeightField;
@property (weak, nonatomic) IBOutlet UITextField *addWeightField;
@property (weak, nonatomic) IBOutlet UITextField *addInfoField;
@property (weak, nonatomic) IBOutlet UIButton *selectOilBtn;

@end

@implementation YZBasicInfoViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     NSLog(@"%@---%@--%@",segue.identifier,segue.sourceViewController,segue.destinationViewController);
    // 获取目的控制器
    UIViewController *v = segue.destinationViewController;
    
    // 给联系人导航条设置标题
    v.navigationItem.title = [NSString stringWithFormat:@"为%@选油",_soapNameField.text];
}
- (IBAction)selectOil:(id)sender {
    [self performSegueWithIdentifier:@"basicInfo2selectOil" sender:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_soapNameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_waterPercentField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_waterWeightField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
    
}

- (void)textChange
{
    _selectOilBtn.enabled = _soapNameField.text.length && _waterPercentField.text.length && _waterWeightField.text.length;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.soapNameField) {
        [self.waterPercentField becomeFirstResponder];
    }else if(textField == self.waterPercentField)
    {
         [self.waterWeightField becomeFirstResponder];
        [self.addInfoField resignFirstResponder];
    }
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
