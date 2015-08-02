//
//  ViewController.m
//  应用管理
//
//  Created by YaguangZhu on 15/7/31.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "ViewController.h"
#import "app.h"
#import "CZAppView.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *apps;


@end

@implementation ViewController
- (NSArray *)apps
{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModels = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            app *model = [app appwithDict:dict];
            
            
           // model.miaoshu = dict[@"miaoshu"];
           // model.icon = dict[@"icon"];
            
            [arrayModels addObject:model];
        }
        _apps =arrayModels;
        
    }
    
    return  _apps;
   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    int colums =3;
    CGFloat viewWidth = self.view.frame.size.width;
    
    CGFloat appW = 75;
    CGFloat appH = 90;
    CGFloat marginTop = 30;
    CGFloat maginX = (viewWidth - colums*appW)/ (colums+1);
    CGFloat maginY = maginX;
    
     for (int i=0;i<self.apps.count;i++)//9 = self.apps.count
    {
        
        app *appModel = self.apps[i];
        
        //xib创建 可以封装下
       // NSBundle *rootBoundle = [NSBundle mainBundle];
       // CZAppView *appview = [[rootBoundle loadNibNamed:@"CZAppView" owner:nil options:nil ] lastObject];
        CZAppView *appview = [CZAppView appView];
        
        int colIdx = i % colums;
        int rowIdx = i / colums;
        CGFloat appX = maginX+ colIdx *(appW +maginX);
        CGFloat appY = marginTop +rowIdx *(appH +maginY);
        appview.frame = CGRectMake(appX, appY, appW, appH);
    
        [self.view addSubview:appview];
       // 用tag来给控件赋值
//        UIImageView *imgViewIcon =  (UIImageView *)[appview viewWithTag:1000];
//        imgViewIcon.image = [UIImage imageNamed:appModel.icon];
//        
//        UILabel *lblName = (UILabel*)[appview viewWithTag:2000];
//        lblName.text = appModel.miaoshu;
        //用自己创建一个类 然后拖拉控件来赋值
//        appview.imgViewIcon.image = [UIImage imageNamed:appModel.icon];
//        appview.lblName.text = appModel.miaoshu;
        
        //以上不这样写说为了安全 和封装性好
        appview.model = appModel;
    
    }
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
