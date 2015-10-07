//
//  myinfoTableViewController.m
//  
//
//  Created by YaguangZhu on 15/10/5.
//
//

#import "myinfoTableViewController.h"
#import "StudentCell.h"
@interface myinfoTableViewController ()
@property(nonatomic,strong)NSDictionary* studentMessageDic;
@end

@implementation myinfoTableViewController

-(void)readStudentMessageFromPlist
{
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager  defaultManager];
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString *documentation = [path   objectAtIndex:0];
    //更改到待操作的目录下
    [fileManager changeCurrentDirectoryPath:[documentation stringByExpandingTildeInPath]];
       NSString *studentPlistPath = [documentation   stringByAppendingPathComponent:@"student.plist"];
    
    _studentMessageDic = [[NSMutableDictionary alloc]initWithContentsOfFile:studentPlistPath];
    
    NSLog(@"%lu", (unsigned long)[_studentMessageDic allKeys].count);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  [[_studentMessageDic allKeys]count];}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *keyValue = [[_studentMessageDic   allKeys]objectAtIndex:indexPath.row];
    NSArray *studenMessageArr = [_studentMessageDic  objectForKey:keyValue];
    
    static NSString *CellIdentifier =@"Cell";
    StudentCell *cell = [tableView   dequeueReusableCellWithIdentifier:@"StudentCell"];
    if (cell == nil)
    {
        if (cell == nil)
        {
            cell = [[StudentCell alloc] init];
        }
    }
    
    
    
    cell.name.text = [studenMessageArr objectAtIndex:0];
    cell.age.text = [studenMessageArr objectAtIndex:1];
    cell.number.text = [studenMessageArr objectAtIndex:2];
    cell.national.text = [studenMessageArr objectAtIndex:3];
    return cell;
}




@end
