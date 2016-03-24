//
//  WBEmotionsModel.h
//  TYDemo
//
//  Created by wanglj on 16/3/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBEmotionsModel : NSObject
@property (copy,nonatomic  ) NSString *emoticon_group_name;//表情分组名称
@property (copy,nonatomic  ) NSString *emoticon_group_identifier;//表情分组ID
@property (copy,nonatomic  ) NSString *emoticon_group_type;//表情分组类型
@property (copy,nonatomic  ) NSString *emoticon_group_path;//表情分组路径
@property (strong,nonatomic) NSArray  *emoticon_group_emotionsArray;//具体表情数组
@end
