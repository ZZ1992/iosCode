//
//  ViewController.m
//  点餐系统
//
//  Created by YaguangZhu on 15/8/27.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)NSArray *foods;
@property (weak, nonatomic) IBOutlet UILabel *fruitLbl;
@property (weak, nonatomic) IBOutlet UILabel *meatLbl;
@property (weak, nonatomic) IBOutlet UILabel *waterLbl;
- (IBAction)random;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int component = 0; component < self.foods.count; component ++) {
        [self pickerView:nil didSelectRow:0 inComponent:component];
    }
}

- (NSArray *)foods
{
    if (_foods == nil) {
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"]];
    }
    
    return _foods;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return self.foods.count;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //    [self.foods objectAtIndex:component].
    
    return [self.foods[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return self.foods[component][row];
    
    //    return @"哈哈";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0) {
        self.fruitLbl.text = self.foods[component][row];
    }else if(component == 1){
        self.meatLbl.text = self.foods[component][row];
    }else{
        self.waterLbl.text = self.foods[component][row];
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)random {
    
    for (int component =0 ; component < self.foods.count; component ++) {
        
        //取出之前的行号
        int oldRow = [self.pickerView selectedRowInComponent:component];
        
        //让当前的行号等于之前的行号
        int row = oldRow;
        
        int count = [self.foods[component] count];
        
        while (row == oldRow) {
            //随机行号
            row = arc4random() %count;
        }
        
        //pickerView 自行选择某行某列
        [self.pickerView selectRow:row inComponent:component animated:YES];
        
        //给下方的label赋值
        [self pickerView:nil didSelectRow:row inComponent:component];
    }

}
@end
