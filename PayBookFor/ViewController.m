//
//  ViewController.m
//  PayBookFor
//
//  Created by Faith on 15-5-14.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    VdiskRestClient *_vdiskRestClient;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor grayColor];
    UISwitch *swith = [[UISwitch alloc] initWithFrame:CGRectMake(40, 100, 100, 50)];
//    [swith setOn:YES];
    [self.view addSubview:swith];
    [swith addTarget:self action:@selector(onSwitcherChanged:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onSwitcherChanged:(id)sender
{
    UISwitch *swith = (UISwitch *)sender;
    if (swith.isOn) {
        
        [[VdiskSession sharedSession] linkWithSessionType:kVdiskSessionTypeWeiboAccessToken];
        
    } else {
        
        [[VdiskSession sharedSession] linkWithSessionType:kVdiskSessionTypeDefault];
    }
}
#pragma mark - SinaWeibo Delegate

- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo {
    
    NSLog(@"sinaweiboDidLogIn userID = %@ accesstoken = %@ expirationDate = %@ refresh_token = %@", sinaweibo.userID, sinaweibo.accessToken, sinaweibo.expirationDate,sinaweibo.refreshToken);
}

- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo {
    
    NSLog(@"sinaweiboDidLogOut");
    
}

- (void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo {
    
    NSLog(@"sinaweiboLogInDidCancel");
}

- (void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error {
    
    NSLog(@"sinaweibo logInDidFailWithError %@", error);
}

- (void)sinaweibo:(SinaWeibo *)sinaweibo accessTokenInvalidOrExpired:(NSError *)error {
    
    NSLog(@"sinaweiboAccessTokenInvalidOrExpired %@", error);
    
}

@end
