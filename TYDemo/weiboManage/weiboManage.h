//
//  weiboManage.h
//  TYDemo
//
//  Created by wanglj on 16/3/15.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weiboManage : NSObject

+ (weiboManage *)shardWeiBOManage;

/**
 *  获取微博列表
 *
 *  @param page          页码
 *  @param requestResult 回调
 */
- (void)requestWeiBo:(NSInteger )page requestResult:(void(^)(BOOL result ,NSMutableArray *array))requestResult;

@end
