//
//  WBLocalEmotionModel.h
//  TYDemo
//
//  Created by wanglj on 16/3/31.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBLocalEmotionModel : NSObject
/**
 *  简体
 */
@property(copy,nonatomic)NSString *chs;
/**
 *  繁体
 */
@property(copy,nonatomic)NSString *cht;
/**
 *  gif图片
 */
@property(copy,nonatomic)NSString *gif;
/**
 *  类型
 */
@property(copy,nonatomic)NSString *type;
/**
 *  png图片
 */
@property(copy,nonatomic)NSString *png;



/**
 *  表情地址
 */
@property (nonatomic,copy) NSString* urlPath;
@end
