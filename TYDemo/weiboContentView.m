//
//  weiboContentView.m
//  TYDemo
//
//  Created by wanglj on 16/3/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "weiboContentView.h"
#import <UIView+SDAutoLayout.h>
#import <TYAttributedLabel.h>
#import "HZPhotoGroup.h"
@implementation weiboContentView{
    /**
     *  微博内容
     */
    TYAttributedLabel *_contentTYAttributedLab;
    /**
     *  转发视图
     */
    UIView *_retweetedView;
    /**
     *  微博转发的内容
     */
    TYAttributedLabel *_retweetedTYAttributedLab;
    /**
     *  图片显示视图
     */
    HZPhotoGroup *_contentImageViewGroup;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup {
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 300);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
