//
//  ViewController.m
//  图片浏览器
//
//  Created by YaguangZhu on 15/7/29.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray *plc;

@property (nonatomic,assign)int index;
- (IBAction)next;
@property (weak, nonatomic) IBOutlet UILabel *lblIndex;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UIButton *btnPro;

- (IBAction)pro;

@end

@implementation ViewController

- (NSArray *)plc
{
    if (_plc == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"plc.plist" ofType:nil ];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        _plc =array;
    }
    return _plc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.index = -1;
    [self next];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next {
    self.index++;
    [self setData];
}
- (IBAction)pro {
    self.index--;
    [self setData];
   
}

- (void)setData
{
    NSDictionary *dict =  self.plc[self.index];
    self.lblIndex.text =[NSString stringWithFormat:@"%d/%ld",self.index+1,self.plc.count ];
    self.ImageView.image = [UIImage imageNamed:dict[@"icon"]];
    self.lblTitle.text = dict[@"miaoshu"];
    
    if(self.index == (self.plc.count -1)){
        self.btnNext.enabled = NO;
    }else
    {
        self.btnNext.enabled= YES;
    }
    
    
    if(self.index == 0){
        self.btnPro.enabled = NO;
    }else
    {
        self.btnPro.enabled= YES;
    }

}
@end
