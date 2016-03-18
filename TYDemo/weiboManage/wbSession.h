//
//  wbSession.h
//  TYDemo
//
//  Created by wanglj on 16/3/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wbSession : NSObject
/**
 *  用户授权是否有效
 */
@property (nonatomic, readonly, getter=isValid) BOOL vaild;
/**
 *  是否已登录
 */
@property (readonly) BOOL hasUserLogin;
/**
 *  微博ID
 */
@property (readonly) NSString *userWBID;
/**
 *  微博认证token
 */
@property (readonly) NSString *accessToken;

/**
 *  保存登录认证信息
 *
 *  @param session 微博客户端处理完第三方应用的认证申请后向第三方应用回送的处理结果
 */
- (void)setCurrentSession:(WBAuthorizeResponse *)session;
@end
