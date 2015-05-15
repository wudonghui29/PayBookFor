//
//  myViewController.m
//  PayBookFor
//
//  Created by Faith on 15-5-14.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import "myViewController.h"
#import "VdiskSDK.h"
#import "AppDelegate.h"
#import "Book.h"

@interface myViewController ()<VdiskRestClientDelegate>
{
    VdiskRestClient *_vdiskRestClient;
}

@end

@implementation myViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake(40, 100, 100, 40)];
    [btn setTitle:@"上传1" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn12 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn12 setFrame:CGRectMake(150, 100, 100, 40)];
    [btn12 setTitle:@"上传2" forState:UIControlStateNormal];
    [self.view addSubview:btn12];
    [btn12 addTarget:self action:@selector(btn12Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn13 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn13 setFrame:CGRectMake(250, 100, 100, 40)];
    [btn13 setTitle:@"上传3" forState:UIControlStateNormal];
    [self.view addSubview:btn13];
    [btn13 addTarget:self action:@selector(btn13Action) forControlEvents:UIControlEventTouchUpInside];

    

    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setFrame:CGRectMake(40, 150, 100, 40)];
    [btn2 setTitle:@"下载" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btn2Action) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn3 setFrame:CGRectMake(200, 150, 100, 40)];
    [btn3 setTitle:@"写进数据" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(btn3Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn4 setFrame:CGRectMake(200, 220, 100, 40)];
    [btn4 setTitle:@"获取数据" forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    [btn4 addTarget:self action:@selector(btn4Action) forControlEvents:UIControlEventTouchUpInside];

    _vdiskRestClient = [[VdiskRestClient alloc] initWithSession:[VdiskSession sharedSession]];
    _vdiskRestClient.delegate = self;

    // Do any additional setup after loading the view.
}
- (void)btn12Action
{
    NSString *path2 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PayBookFor.sqlite-shm"];
    
        [_vdiskRestClient uploadFile:@"qq"
                              toPath:@"/b"
                       withParentRev:nil
                            fromPath:path2];

}
- (void)btn13Action
{
    NSString *path2 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PayBookFor.PayBookFor.sqlite-wal"];
    
    NSString *path3 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PayBookFor.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager moveItemAtPath:path2 toPath:path3 error:nil];
//    [_vdiskRestClient uploadFile:@"bbPayBookFor.sqlite-wal"
//                          toPath:@"/b"
//                   withParentRev:nil
//                        fromPath:path2];

}

- (void)btnAction
{
//    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/345.txt"];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PayBookFor.sqlite"];
    NSString *path2 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PayBookFor.sqlite-shm"];
    NSString *path3 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PayBookFor.sqlite-wal"];
//
    NSArray *paths = @[path,path2,path3];
    NSArray *folderArray = @[@"cccPayBookFor.sqlite",@"cccPayBookFor.sqlite-shm",@"cccPayBookFor.sqlite-wal"];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"tr" ofType:nil];
    for(int i = 0;i<3;i++)
    {
        NSString *pathh = paths[i];
        NSString *f = folderArray[i];
        [_vdiskRestClient uploadFile:f
                              toPath:@"/b"
                       withParentRev:nil
                            fromPath:pathh];

    }
//    [_vdiskRestClient uploadFile:@"PayBookFor.sqlite"
//                          toPath:@"/b"
//                   withParentRev:nil
//                        fromPath:path];
//    [_vdiskRestClient uploadFile:@"PayBookFor.sqlite-shm"
//                          toPath:@"/b"
//                   withParentRev:nil
//                        fromPath:path2];
//    [_vdiskRestClient uploadFile:@"PayBookFor.sqlite-wal"
//                          toPath:@"/b"
//                   withParentRev:nil
//                        fromPath:path3];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)restClient:(VdiskRestClient *)client uploadedFile:(NSString *)destPath from:(NSString *)srcPath metadata:(VdiskMetadata *)metadata {
    NSLog(@"metadata++++++++++:%@",metadata.filename);
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Upload success!" message:@"Please look at the metadata object" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    
    [alertView show];
//    NSLog(@"metadata:%@",metadata);
    
//    [_uploadButton setEnabled:YES];
//    [_uploadButton setTitle:@"Select a photo to upload" forState:UIControlStateNormal];
    
    //delete tmp file, 如果有必要的话
//    [[NSFileManager defaultManager] removeItemAtPath:srcPath error:nil];
}


- (void)btn2Action
{
    NSString *tmpPath = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingFormat: @"/Documents"], @"PayBookFor.sqlite"];
    NSString *path = @"/b/cccPayBookFor.sqlite";
    [_vdiskRestClient loadFile:path intoPath:tmpPath];
    
    NSString *tmpPath2 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingFormat: @"/Documents"], @"PayBookFor.sqlite-shm"];
    NSString *path2 = @"/b/cccPayBookFor.sqlite-shm";
    [_vdiskRestClient loadFile:path2 intoPath:tmpPath2];
    
    NSString *tmpPath3 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingFormat: @"/Documents"], @"PayBookFor.sqlite-wal"];
    NSString *path3 = @"/b/cccPayBookFor.sqlite-wal";
    [_vdiskRestClient loadFile:path3 intoPath:tmpPath3];

}

- (void)btn3Action
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSEntityDescription *bEntity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
    
    NSArray *bookNameArray = @[@"ios开发指南",@"Objective-c语言",@"JAVA语言"];
    NSArray *autorArray = @[@"吴",@"龙",@"潘"];
    for(int i = 0; i<bookNameArray.count;i++)
    {
        Book *book = [[Book alloc] initWithEntity:bEntity insertIntoManagedObjectContext:context];
        
        book.name = bookNameArray[i];
        book.author = autorArray[i];
        [context save:nil];
        
    }

}
- (void)btn4Action
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Book"];
    NSArray *arr = [context executeFetchRequest:request error:nil];
    for(Book *b in arr)
    {
        NSLog(@"%@-%@",b.name,b.author);
    }

}
//更新进度
- (void)restClient:(VdiskRestClient *)client uploadProgress:(CGFloat)progress forFile:(NSString *)destPath from:(NSString *)srcPath {
    
//    [_progressLabel setHidden:NO];
//    [_progressView setHidden:NO];
//    
//    [_progressView setProgress:progress];
//    _progressLabel.text = [NSString stringWithFormat:@"%.1f%%", progress*100.0f];
}

//处理上传失败后的工作
- (void)restClient:(VdiskRestClient *)client uploadFileFailedWithError:(NSError *)error {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ERROR!!"
                                                        message:[NSString stringWithFormat:@"Error!\nerrno:%d\n%@\%@\n",
                                                                 error.code,
                                                                 error.localizedDescription,
                                                                 [error userInfo]]
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
    
    [alertView show];
}
//    [alertView release];
    
//    [_uploadButton setEnabled:YES];
//    [_uploadButton setTitle:@"Select a photo to upload" forState:UIControlStateNormal];

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
