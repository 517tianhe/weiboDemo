//
//  WBKeywordModel.h
//  TYDemo
//
//  Created by wanglj on 16/3/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBKeywordModel : NSObject
@property (nonatomic,copy)NSString  *keyword;//名称
@property(nonatomic,copy)NSString    *url;//地址
@property (nonatomic,assign)NSRange range;//位置
@end
