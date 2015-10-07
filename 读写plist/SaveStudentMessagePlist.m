//
//  SaveStudentMessagePlist.m
//  
//
//  Created by YaguangZhu on 15/10/5.
//
//

#import "SaveStudentMessagePlist.h"

@implementation SaveStudentMessagePlist

-(id)initWithStudentName:(NSString *)name Studentage:(NSString *)age StudentNumber:(NSString * )numerb StudentNation:(NSString *)nation
{
    //我们把学生的信息保存在可变数组里
    NSMutableArray *studentMessageArray = [[NSMutableArray  alloc]initWithObjects:name,age,numerb,nation,nil];
    if (self = [superinit])
    {
        [self createStudentMessagePlist:studentMessageArraykey:numerb];  // 因为学生的学号是唯一的作为词典的key值
    }
    return self;
    
}

// 创建plist 写入操作
-(void)createStudentMessagePlist:(NSMutableArray *)studentMessageArray key:(NSString *)studentNumebr
{
    
    //沙盒路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    // plist 路径
    NSString *plistPath    = [documentsDirectorystringByAppendingPathComponent:@"student.plist"];
    NSFileManager *fileManager = [[NSFileManager  alloc]init];
    // 下面这几步很重要  通过文件管理器 来判读plist 文件是否存在！ 如果不存在 我们就通过  [fileManager createFileAtPath:plistPath contents:nil attributes:nil创建一个plist 并检测是否成功失败！存在后写入词典如何存在plist 我们就 在 studentMessageDic 可变词典里保存在来色数据这样可以避免数据被覆盖问题
    
    
    if(![fileManager fileExistsAtPath:plistPath])
    {
        if(![fileManager createFileAtPath:plistPathcontents:nilattributes:nil])
        {
            NSLog(@"create file error");
        }
        else
        {
            
            NSDictionary* studentMessageDic = [NSDictionary   dictionaryWithObjectsAndKeys:studentMessageArray,studentNumebr ,nil];
            [studentMessageDic writeToFile:plistPathatomically:YES];
            
        }
    }
    else
    {
        
        NSMutableDictionary   *studentMessageDic  = [[NSMutableDictionary  alloc]initWithContentsOfFile: plistPath];
        [studentMessageDic   setObject:  studentMessageArray forKey:studentNumebr ];
        [studentMessageDic   writeToFile:plistPathatomically:YES];
        
    }
    
    
}



@end
