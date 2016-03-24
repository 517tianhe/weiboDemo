//
//  NSString+Size.h
//  TYDemo
//
//  Created by wanglj on 16/3/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
