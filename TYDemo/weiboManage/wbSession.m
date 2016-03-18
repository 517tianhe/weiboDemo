//
//  wbSession.m
//  TYDemo
//
//  Created by wanglj on 16/3/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "wbSession.h"
#import "NSDate+TH.h"
static NSString * const  kHasUser = @"hasUser";
static NSString * const  kUserWBID=@"userWBID";
static NSString * const  kAccessToken=@"accessToken";
static NSString * const  kExpirationDate=@"expirationDate";

@implementation wbSession

- (void)setCurrentSession:(WBAuthorizeResponse *)session {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:kHasUser];
    [userDefaults setObject:session.userID forKey:kUserWBID];
    [userDefaults setObject:session.accessToken forKey:kAccessToken];
    [userDefaults setObject:session.expirationDate forKey:kExpirationDate];
    [userDefaults synchronize];
}

- (NSString *)userWBID {
    if ([self hasUserLogin]) {
        return [[NSUserDefaults standardUserDefaults]objectForKey:kUserWBID];
    }
    return nil;
}

- (NSString *)accessToken {
    if ([self hasUserLogin]) {
        return [[NSUserDefaults standardUserDefaults]objectForKey:kAccessToken];
    }
    return nil;
}


- (BOOL)hasUserLogin {
    BOOL hasUser=[[NSUserDefaults standardUserDefaults]boolForKey:kHasUser];
    if (hasUser)
    {
        if ([self isValid])
        {
            hasUser=YES;
        }
        else
        {
            hasUser=NO;
        }
    }
    return hasUser;
}

-(BOOL)isValid
{
    BOOL valid=NO;
    
    //当前日期
    NSDate *today=[NSDate date];
    
    //过期日期
    NSDate *expirationDate=[[NSUserDefaults standardUserDefaults]objectForKey:kExpirationDate];
    
    if (expirationDate)
    {
        if ([today ShortCutStringWithStrFormatter:@"yyyyMMddHHmmss"].integerValue>[expirationDate ShortCutStringWithStrFormatter:@"yyyyMMddHHmmss"].integerValue)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    else
    {
        valid=NO;
    }
    return valid;
}
@end
