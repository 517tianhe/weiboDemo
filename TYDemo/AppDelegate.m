//
//  AppDelegate.m
//  TYDemo
//
//  Created by wanglj on 16/3/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "AppDelegate.h"
#import "wbSession.h"
#import "userLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self weiboSDKInit];
    [self windowRootViewControllerSetup];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 微博SDK
/**
 *  SDK初始化
 */
- (void) weiboSDKInit {
    [WeiboSDK enableDebugMode:YES];
    BOOL flag = [WeiboSDK registerApp:kAppKey];
    if (flag) {
        NSLog(@"weiboSDK 注册成功");
    }else {
        NSLog(@"weiboSDK 失败");
    }
    
//    WBSession *session=[[WBSession alloc]init];
//    if ([session hasUser])
//    {
//
//    }
//    else
//    {
//        WBLoginViewController *loginViewController=[[WBLoginViewController alloc]init];
//        __typeof (self) __weak weakSelf = self;
//        [loginViewController setDismissViewBlock:^{
//            [weakSelf.tableView.header beginRefreshing];
//        }];
//        [self presentViewController:loginViewController animated:YES completion:nil];
//    }
}
#pragma Weibo Delegate
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}


- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {
        //do thing
    }
}
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        wbSession *session=[[wbSession alloc]init];
        [session setCurrentSession:(WBAuthorizeResponse *)response];
        [[NSNotificationCenter defaultCenter]postNotificationName:KLoginNotification object:self];
    }
}

#pragma mark - 其他方法处理
/**
 *  设置rootViewController
 */
- (void)windowRootViewControllerSetup {
    wbSession *session=[[wbSession alloc]init];
    if ([session hasUserLogin]) {
        
    }
    else {
        userLoginViewController *loginControlier = [[userLoginViewController alloc]init];
        UINavigationController *navicationController = [[UINavigationController alloc]initWithRootViewController:loginControlier];
        self.window.rootViewController = navicationController;
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
    }
}

@end
