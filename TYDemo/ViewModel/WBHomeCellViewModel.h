//
//  WBHomeCellViewModel.h
//  TYDemo
//
//  Created by wanglj on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TYAttributedLabel/TYAttributedLabel.h>
#import "WBStatusModel.h"
@interface WBHomeCellViewModel : NSObject

@property(strong,nonatomic)WBStatusModel *statusModel;
//@property(strong,nonatomic)NSAttributedString *attributedString;
@property (nonatomic, strong) TYTextContainer *textContainer;
/**
 *  表情数组
 */
@property(strong,nonatomic)NSArray *emotionArray;//
/**
 *  at
 */
@property(strong,nonatomic)NSArray *atPersonArray;//
/**
 *  网址数组
 */
@property(strong,nonatomic)NSArray *urlArray;//
/**
 *  话题
 */
@property(strong,nonatomic)NSArray *topicArray;//
/**
 *  微博等级URl
 */
@property(copy,nonatomic)NSString *mlevelImageUrl;//
/**
 *  时间显示出来的
 */
@property(copy,nonatomic)NSString *timestamp;//

@property(assign,nonatomic)CGFloat timestampWidth;
/**
 *  本身内容高度
 */
@property(assign,nonatomic)float  contentHeight;//
/**
 *  图片高度
 */
@property(assign,nonatomic)float  contengImageHeight;//
@end
