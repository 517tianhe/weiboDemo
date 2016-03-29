//
//  UIImage+ShortCut.h
//  TYDemo
//
//  Created by wanglj on 16/3/29.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (ShortCut)
//=============================================================================
/// @name Create image
///=============================================================================
/**
 *  将色值返回为1x1像素的png图片
 *
 *  @param color UIColor
 *
 *  @return 返回为1x1像素的png图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 *   重置图片大小
 *
 *  @param size 大小
 *
 *  @return 新的图片
 */
- (UIImage *)imageScaledToSize:(CGSize)size;

///=============================================================================
/// @name Get info from image
///=============================================================================

/**
 *  获取该图片的某像素点的颜色
 *
 *  @param point 点坐标
 *
 *  @return 返回UIColor 或者错误(nil)
 */
- (UIColor *)colorAtPoint:(CGPoint )point;
/**
 *  返回该图片是否有透明度通道
 *
 *  @return YES, NO
 */
- (BOOL)hasAlphaChannel;


/**
 *  九宫格图片拉伸
 *
 *  @return UIImage
 */
-(UIImage *)ImageWithLeftCapWidth;
@end
