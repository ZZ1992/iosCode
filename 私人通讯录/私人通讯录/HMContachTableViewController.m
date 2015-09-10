//
//  HMContachTableViewController.m
//  私人通讯录
//
//  Created by YaguangZhu on 15/9/6.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMContachTableViewController.h"
#import "HMAddViewController.h"
#import "HMContact.h"
#import "HMContactCell.h"
#import "HMEditViewController.h"
#define HMFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contact.data"]
@interface HMContachTableViewController ()<UIActionSheetDelegate,HMAddViewControllerDelgegate,HMEditViewControllerDelegate>
@property (nonatomic,strong)NSMutableArray *contacts;
@end

@implementation HMContachTableViewController

- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:HMFilePath];
        if (_contacts == nil) {
            _contacts = [NSMutableArray array];
        }
        
    }
    return _contacts;
}
- (void)setName:(NSString *)name phone:(NSString *)phone
{
    NSLog(@"%@---%@",name,phone);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    HMAddViewController *vc = segue.destinationViewController;
//   // vc.contacts = self;
//    vc.delegate =self;
    
    
    if ([segue.destinationViewController isKindOfClass:[HMAddViewController class]]) {
        
        HMAddViewController *vc = segue.destinationViewController;
        
        vc.delegate = self;
    }else{ // 跳转到编辑控制器
        HMEditViewController *edit = segue.destinationViewController;
        
        NSIndexPath *seletedIndex = [self.tableView indexPathForSelectedRow];
        
        edit.delegate = self;
        edit.contact = self.contacts[seletedIndex.row];
        
    }

}

// 成功更新了一个联系人的时候调用
- (void)editViewController:(HMEditViewController *)edit didUpdateContact:(HMContact *)contact
{
    
    // 刷新表格
    [self.tableView reloadData];
}

- (void)addViewController:(HMAddViewController *)add didAddContact:(HMContact *)contact
{
    [self.contacts addObject:contact];
    
    [self.tableView reloadData];
    NSLog(@"%@",contact.name);
    
    //NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contact.data"];
    
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:HMFilePath];
}

- (IBAction)loginout:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"是否取消？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) return;
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.contacts.count;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex:indexPath.row];
        //全局刷新界面
        [self.tableView reloadData];
        // 局部刷新
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *ID = @"contact";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    HMContact *contact  = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    
    return cell;
    
    // 1.创建对象
    //HMContactCell *cell = [HMContactCell cellWithTableView:tableView];
    
       // HMContact *contact1  = self.contacts[indexPath.row];
       // cell.textLabel.text = contact.name;
       // cell.detailTextLabel.text = contact.phone;
       // cell.contact = contact1;
    // 2.传递模型
    //cell.contact = self.contacts[indexPath.row];
    
    //return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
