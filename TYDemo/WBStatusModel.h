//
//  WBStatusModel.h
//  TYDemo
//
//  Created by wanglj on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBStatusModel : NSObject
/**
 *  微博创建时间
 */
@property(copy,nonatomic)NSString *created_at;
//@property(assign,nonatomic)NSInteger idd;//微博ID(目前没用)
/**
 *  微博MID
 */
@property(assign,nonatomic)NSInteger mid;
/**
 *  字符串型的微博ID
 */
@property(copy,nonatomic)NSString *idstr;
/**
 *  微博信息内容
 */
@property(copy,nonatomic)NSString *text;//
/**
 *  微博来源
 */
@property(copy,nonatomic)NSString *source;//
/**
 *  是否已收藏，true：是，false：否
 */
@property(assign,nonatomic)bool favorited;//
/**
 *  是否被截断，true：是，false：否
 */
@property(assign,nonatomic)bool truncated;//
/**
 *  缩略图片地址，没有时不返回此字段
 */
@property(copy,nonatomic)NSString *thumbnail_pic;//
/**
 *  中等尺寸图片地址，没有时不返回此字段
 */
@property(copy,nonatomic)NSString *bmiddle_pic;//
/**
 *  原始图片地址，没有时不返回此字段
 */
@property(copy,nonatomic)NSString *original_pic;//
/**
 *  地理信息字段
 */
@property(strong,nonatomic)id geo;//
/**
 *  微博作者的用户信息字段
 */
@property(strong,nonatomic)id user;//
/**
 *  被转发的原微博信息字段，当该微博为转发微博时返回
 */
@property(strong,nonatomic)id retweeted_status;//
/**
 *  转发数
 */
@property(assign,nonatomic)NSInteger reposts_count;//
/**
 *  评论数
 */
@property(assign,nonatomic)NSInteger comments_count;//
/**
 *  表态数(赞)
 */
@property(assign,nonatomic)NSInteger attitudes_count;//
/**
 *  等级(会员)
 */
@property(assign,nonatomic)NSInteger mlevel;//
/**
 *  微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
 */
@property(strong,nonatomic)id visible;//
/**
 *  微博配图地址。多图时返回多图链接。无配图返回“[]”
 */
@property(strong,nonatomic)NSMutableArray *pic_urls;//

@property(assign,nonatomic)CGFloat sourceWidth;

@end
