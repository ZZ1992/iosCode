//
//  ViewController.m
//  plistdemo2
//
//  Created by YaguangZhu on 15/10/5.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UITextField *textInput;

@end

@implementation ViewController
- (IBAction)triggerStorage:(id)sender {
    self.displayLabel.text = self.textInput.text;
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths    objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"test.plist"];   //获取路径
    
    NSDictionary* dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];  //读取数据
    NSLog(@"dic2 is:%@",dic2);
    
    //创建一个dic，写到plist文件里
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:self.displayLabel.text,@"IP",nil]; //写入数据
    [dic writeToFile:filename atomically:YES];
}

- (void)viewDidLoad {
    NSMutableArray *resultData;
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSLog(@"path = %@",path);
    NSString *filename=[path stringByAppendingPathComponent:@"test.plist"];
    
    //读文件
    NSDictionary* dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];
    NSLog(@"dic is:%@",dic2);
    if(dic2 == nil)
    {
        //1. 创建一个plist文件
        NSFileManager* fm = [NSFileManager defaultManager];
        [fm createFileAtPath:filename contents:nil attributes:nil];
    }
    else
    {
        resultData=[dic2 objectForKey:@"IP"];
        if([dic2 count] > 0)
        {
            self.displayLabel.text = resultData;
        }
        else
        {
            self.displayLabel.text = @" ";
        }
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"save" style:UIBarButtonItemStylePlain target:self action:@selector(triggerStorage)];
    [super viewDidLoad];
}

- (void)triggerStorage
{
    self.displayLabel.text = self.textInput.text;
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths    objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"test.plist"];   //获取路径
    
    NSDictionary* dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];  //读取数据
    NSLog(@"dic2 is:%@",dic2);
    
    //创建一个dic，写到plist文件里
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:self.displayLabel.text,@"IP",nil]; //写入数据
    [dic writeToFile:filename atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
