//
//  WBBottomView.m
//  TYDemo
//
//  Created by wanglj on 16/3/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "WBBottomView.h"
#import <HexColors.h>
#import <UIView+SDAutoLayout.h>

@implementation WBBottomView {
    UIButton *_btnForwarding;
    UIButton *_btnComments;
    UIButton *_btnPraise;
}

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
    UIView *topline = [UIView new];
    [self addSubview:topline];
    topline.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"d8d8d8"];
    topline.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(1);
    
    UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_card_bottom_background"]];
    [self addSubview:backImage];
    backImage.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
    /**
     *  转发
     */
    _btnForwarding = [UIButton new];
    _btnForwarding.backgroundColor = [UIColor clearColor];
    [_btnForwarding setImage:[UIImage imageNamed:@"timeline_icon_retweet"] forState:UIControlStateNormal];
    [_btnForwarding setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _btnForwarding.titleLabel.font = [UIFont systemFontOfSize:13];
    _btnForwarding.imageEdgeInsets=UIEdgeInsetsMake(0,0,0,10);
    _btnForwarding.titleEdgeInsets=UIEdgeInsetsMake(0,10,0,0);
    [self addSubview:_btnForwarding];
    _btnForwarding.sd_layout
    .topEqualToView(self)
    .bottomEqualToView(self)
    .leftEqualToView(self)
    .heightRatioToView(_btnComments,1);
    
    UIImageView *oneline = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line_os7"]];
    oneline.backgroundColor = [UIColor clearColor];
    [self addSubview:oneline];
    oneline.sd_layout
    .topEqualToView(self)
    .bottomEqualToView(self)
    .leftEqualToView(_btnForwarding)
    .rightEqualToView(_btnComments)
    .widthIs(1);
    
    /**
     *  评论
     */
    _btnComments = [UIButton new];
    _btnComments.backgroundColor = [UIColor clearColor];
    [_btnComments setImage:[UIImage imageNamed:@"timeline_icon_comment"] forState:UIControlStateNormal];
    [_btnComments setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _btnComments.titleLabel.font = [UIFont systemFontOfSize:13];
    _btnComments.imageEdgeInsets=UIEdgeInsetsMake(0,0,0,10);
    _btnComments.titleEdgeInsets=UIEdgeInsetsMake(0,10,0,0);
    [self addSubview:_btnComments];
    _btnComments.sd_layout
    .topEqualToView(self)
    .bottomEqualToView(self)
    .heightRatioToView(_btnPraise,1);
    
    UIImageView *twoline = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line_os7"]];
    twoline.backgroundColor = [UIColor clearColor];
    [self addSubview:twoline];
    twoline.sd_layout
    .topEqualToView(self)
    .bottomEqualToView(self)
    .leftEqualToView(_btnComments)
    .rightEqualToView(_btnPraise)
    .widthIs(1);
    
    
    _btnPraise = [UIButton new];
    _btnPraise.backgroundColor = [UIColor clearColor];
    [_btnPraise setImage:[UIImage imageNamed:@"timeline_icon_unlike"] forState:UIControlStateNormal];
    [_btnPraise setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _btnPraise.titleLabel.font = [UIFont systemFontOfSize:13];
    _btnPraise.imageEdgeInsets=UIEdgeInsetsMake(0,0,0,10);
    _btnPraise.titleEdgeInsets=UIEdgeInsetsMake(0,10,0,0);
    [self addSubview:_btnPraise];
    _btnPraise.sd_layout
    .topEqualToView(self)
    .bottomEqualToView(self)
    .rightEqualToView(self)
    .heightRatioToView(_btnForwarding,1);
}

- (void)setHomeCellViewModel:(WBHomeCellViewModel *)homeCellViewModel {
    _homeCellViewModel=homeCellViewModel;
    
    //底部
    [_btnForwarding setTitle:_homeCellViewModel.statusModel.reposts_count==0?@"转发":[NSString stringWithFormat:@"%ld",(long)_homeCellViewModel.statusModel.reposts_count] forState:UIControlStateNormal];
    [_btnComments setTitle:_homeCellViewModel.statusModel.comments_count==0?@"评论":[NSString stringWithFormat:@"%ld",(long)_homeCellViewModel.statusModel.comments_count] forState:UIControlStateNormal];
    [_btnPraise setTitle:_homeCellViewModel.statusModel.attitudes_count==0?@"赞":[NSString stringWithFormat:@"%ld",(long)_homeCellViewModel.statusModel.attitudes_count] forState:UIControlStateNormal];
}

@end
