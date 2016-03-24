//
//  userLoginViewController.m
//  TYDemo
//
//  Created by wanglj on 16/3/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "userLoginViewController.h"
#import "ViewController.h"

@interface userLoginViewController ()

@end

@implementation userLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginNotification) name:KLoginNotification object:nil];
    [self userLogining];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)userLogining {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)loginNotification {
    UIViewController *hoemViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"homeController"];
    [self.navigationController pushViewController:hoemViewController animated:YES];
    //[self dismissViewControllerAnimated:YES completion:self.dismissViewBlock];
}

@end
