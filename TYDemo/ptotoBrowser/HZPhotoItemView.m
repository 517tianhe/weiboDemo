//
//  HZPhotoItemView.m
//  TYDemo
//
//  Created by wanglj on 16/3/30.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "HZPhotoItemView.h"
#import <UIView+SDAutoLayout.h>

@implementation HZPhotoItemView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup {
    _btn = [[UIButton alloc]init];
    _photo = [[UIImageView alloc]init];
    
    [self addSubview:_photo];
    [self addSubview:_btn];
    _photo.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    _btn.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
}
@end
