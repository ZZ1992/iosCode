 //
//  ViewController.m
//  表格控件
//
//  Created by YaguangZhu on 15/8/13.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "HMStudent.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSArray *dataList;
@end


@implementation ViewController
- (NSArray *)dataList
{
    if(_dataList == nil)
    {
        
        
        HMStudent *stu1 =[[HMStudent alloc]init];
        stu1.title=@"黑马1气";
        stu1.desc=@"good";
        
        NSMutableArray *array1 = [NSMutableArray array];
        for (int i=0; i<10; i++) {
            [array1 addObject:[NSString stringWithFormat:@"%@ - - %04d",stu1.title,i]];
            stu1.students = array1;
        }
        
        HMStudent *stu2 =[[HMStudent alloc]init];
        stu2.title=@"黑马2气";
        stu2.desc=@"good";
        NSMutableArray *array2 = [NSMutableArray array];
        for (int i=0; i<10; i++) {
            [array2 addObject:[NSString stringWithFormat:@"%@ - - %04d",stu2.title,i]];
            stu2.students = array2;
            
            _dataList = @[stu1,stu2];
        }
        
        
    }
    return _dataList;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HMStudent *stu = self.dataList[section];
    return stu.students.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    HMStudent *stu = self.dataList[indexPath.section];
    cell.textLabel.text=stu.students[indexPath.row];
    return cell;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    HMStudent *stu = self.dataList[section];
    
    return stu.title;

}// fixed font style. use custom view (UILabel) if you want something different
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    HMStudent *stu = self.dataList[section];

    return stu.desc;
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
