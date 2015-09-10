//
//  ViewController.m
//  画板
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "HMPaintView.h"
#import "MBProgressHUD+MJ.h"
@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet HMPaintView *paintView;

@end

@implementation ViewController
- (IBAction)save:(id)sender {
    UIGraphicsBeginImageContextWithOptions(_paintView.bounds.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [_paintView.layer renderInContext:ctx];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        [MBProgressHUD showError:@"保存失败"];
    }else
    {
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}

- (IBAction)selectPicture:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
   
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    _paintView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)eraser:(id)sender {
    _paintView.color = [UIColor lightGrayColor];
}

- (IBAction)undo:(id)sender {
    [_paintView undo];

}

- (IBAction)clearScreen:(id)sender {
    [_paintView clearScreen];
}


- (IBAction)colorClick:(UIButton *)sender {
    _paintView.color = sender.backgroundColor;
}


- (IBAction)valueChange:(UISlider *)sender {
    _paintView.width = sender.value;
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
