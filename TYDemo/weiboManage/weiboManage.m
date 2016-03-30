//
//  weiboManage.m
//  TYDemo
//
//  Created by wanglj on 16/3/15.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "weiboManage.h"
#import "wbSession.h"
#import <MJExtension.h>
#import "WBDataModel.h"
#import "WBStatusModel.h"
#import "WBUserModel.h"
#import "WBHomeCellViewModel.h"

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
                          @"count":@"10",
                          @"page":[NSString stringWithFormat:@"%zd",page],
                          @"base_app":@"0",
                          @"feature":@"0",
                          @"trim_user":@"0"
                          };
    [WBHttpRequest requestWithAccessToken:session.accessToken url:@"https://api.weibo.com/2/statuses/friends_timeline.json" httpMethod:@"GET" params:dic delegate:self withTag:@"1"];
    self.resultHandler = requestResult;
}

#pragma mark - 成功

- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result {
    
    WBDataModel *model = [WBDataModel mj_objectWithKeyValues:result];
    if (model.statuses.count <= 0) {
        self.resultHandler(NO,nil);
    }else {
        NSMutableArray *statusArray = [NSMutableArray array];
        for (NSDictionary *dic in model.statuses) {
            WBStatusModel *statusModel = [WBStatusModel mj_objectWithKeyValues:dic];
            if (statusModel.user) {
                statusModel.user = [WBUserModel mj_objectWithKeyValues:statusModel.user];
            }
            if (statusModel.retweeted_status != nil) {
                statusModel.retweeted_status = [WBStatusModel mj_objectWithKeyValues:statusModel.retweeted_status];
                WBStatusModel *retweetedModel=statusModel.retweeted_status;
                WBUserModel *userModel=[WBUserModel mj_objectWithKeyValues:retweetedModel.user];
                retweetedModel.user = userModel;
                retweetedModel.text=[NSString stringWithFormat:@"@%@:%@",userModel.name,retweetedModel.text];
            }
            [statusArray addObject:statusModel];
        }
        //转换成viewModel
        NSMutableArray *weiboArray = [NSMutableArray array];
        for (WBStatusModel *model in statusArray) {
            if (model.retweeted_status != nil) {
                WBHomeCellViewModel *retWeetedViewModel = [[WBHomeCellViewModel alloc]init];
                retWeetedViewModel.statusModel = model.retweeted_status;
                model.retweeted_status = retWeetedViewModel;
            }
            WBHomeCellViewModel *homeCellViewModel = [[WBHomeCellViewModel alloc]init];
            homeCellViewModel.statusModel = model;
            [weiboArray addObject:homeCellViewModel];
        }
        self.resultHandler(YES,weiboArray);
    }
}

#pragma 失败
-(void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error;
{
    self.resultHandler(NO,nil);
}

@end
