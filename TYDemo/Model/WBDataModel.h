//
//  WBDataModel.h
//  TYDemo
//
//  Created by wanglj on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBDataModel : NSObject
/**
 *  微博内容信息
 */
@property(strong,nonatomic)NSMutableArray *statuses;
/**
 *  微博流内的推广微博ID
 */
@property(strong,nonatomic)NSMutableArray *ad;
/**
 *  总的条数
 */
@property(assign,nonatomic)NSInteger total_number;

@end
