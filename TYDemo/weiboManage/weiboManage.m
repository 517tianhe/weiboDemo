//
//  weiboManage.m
//  TYDemo
//
//  Created by wanglj on 16/3/15.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "weiboManage.h"
#import "wbSession.h"

@interface weiboManage()<WBHttpRequestDelegate>
@property(copy,nonatomic)void(^resultHandler)(BOOL result,NSMutableArray *array);
@end

@implementation weiboManage

+(weiboManage *)shardWeiBOManage {
    static id shardInstance;
    static dispatch_once_t onecToken;
    dispatch_once(&onecToken, ^{
        shardInstance = [[self alloc]init];
    });
    return shardInstance;
}
- (void)requestWeiBo:(NSInteger)page requestResult:(void (^)(BOOL, NSMutableArray *))requestResult {
    wbSession *session = [[wbSession alloc]init];
    NSDictionary *dic = @{@"source":kAppKey,
                          @"access_token":session.accessToken,
                          @"since_id":@"0",
                          @"max_id":@"0",
                          @"count":@"200",
                          @"page":[NSString stringWithFormat:@"%zd",page],
                          @"base_app":@"0",
                          @"feature":@"0",
                          @"trim_user":@"0"
                          };
    [WBHttpRequest requestWithAccessToken:session.accessToken url:@"https://api.weibo.com/2/statuses/friends_timeline.json" httpMethod:@"GET" params:dic delegate:self withTag:@"1"];
    self.resultHandler = requestResult;
}

#pragma mark - 成功




@end
