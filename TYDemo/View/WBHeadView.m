//
//  WBHeadView.m
//  TYDemo
//
//  Created by wanglj on 16/3/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "WBHeadView.h"
#import <UIView+SDAutoLayout.h>
#import <UIImageView+WebCache.h>
#import "WBUserModel.h"
#import <HexColors.h>

@implementation WBHeadView {
    /**
     *  头像的最外层View;
     */
    UIButton *_contactAvatarView;
    /**
     *  头像
     */
    UIImageView *_imgAvatarView;
    /**
     *  微博头像类型
     */
    UIImageView *_imgAvaterType;

    /**
     *  昵称
     */
    UILabel *_userLabel;
    /**
     *  用户vip
     */
    UIImageView *_imgVip;
    /**
     *  发布时间
     */
    UILabel *_releaseTimeLab;
    /**
     *  发布终端
     */
    UILabel *_releaseTerminal;
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

- (void)setup{
    //self.backgroundColor = [UIColor greenColor];
    _contactAvatarView = [[UIButton alloc]init];
    [self addSubview:_contactAvatarView];
    _imgAvatarView = [[UIImageView alloc]init];
    [self addSubview:_imgAvatarView];
    _imgAvaterType = [[UIImageView alloc]init];
    [self addSubview:_imgAvaterType];
    
    _userLabel = [[UILabel alloc]init];
    [self addSubview:_userLabel];
    _imgVip = [[UIImageView alloc]init];
    [self addSubview:_imgVip];
    
    _releaseTimeLab = [[UILabel alloc]init];
    _releaseTerminal = [[UILabel alloc]init];
    _releaseTerminal.textColor = [UIColor hx_colorWithHexRGBAString:@"888888"];
    _releaseTimeLab.textColor = [UIColor hx_colorWithHexRGBAString:@"888888"];
    _releaseTimeLab.font = SUBTITLE_FONT_SIZE;
    _releaseTerminal.font = SUBTITLE_FONT_SIZE;
    [self addSubview:_releaseTerminal];
    [self addSubview:_releaseTimeLab];
    
    
    _contactAvatarView.backgroundColor = [UIColor clearColor];
    _contactAvatarView.sd_layout
    .centerYEqualToView(self)
    .leftSpaceToView(self,CELL_SIDEMARGIN)
    .widthIs(40)
    .heightIs(40);
    
    _imgAvatarView.sd_layout
    .topEqualToView(_contactAvatarView)
    .leftEqualToView(_contactAvatarView)
    .bottomEqualToView(_contactAvatarView)
    .rightEqualToView(_contactAvatarView);
    _imgAvatarView.sd_cornerRadiusFromHeightRatio = @0.5;
    
    _imgAvaterType.sd_layout
    .bottomEqualToView(_contactAvatarView)
    .rightEqualToView(_contactAvatarView)
    .heightIs(17)
    .widthIs(17);

    _userLabel.sd_layout
    .topEqualToView(_contactAvatarView)
    .leftSpaceToView(_contactAvatarView,15)
    .heightIs(17);
    _imgVip.sd_layout
    .leftSpaceToView(_userLabel,5)
    .topEqualToView(_userLabel)
    .bottomEqualToView(_userLabel)
    .widthEqualToHeight();
    
    _releaseTimeLab.sd_layout
    .leftEqualToView(_userLabel)
    .topSpaceToView(_userLabel,5)
    .heightIs(15);
    _releaseTerminal.sd_layout
    .leftSpaceToView(_releaseTimeLab,0)
    .topEqualToView(_releaseTimeLab)
    .rightEqualToView(self)
    .heightIs(15);
    
}

- (void)setHomeCellViewModel:(WBHomeCellViewModel *)homeCellViewModel {
    _homeCellViewModel = homeCellViewModel;
    
    WBUserModel *userModel = _homeCellViewModel.statusModel.user;
    
    [_imgAvatarView sd_setImageWithURL:[NSURL URLWithString:userModel.profile_image_url] placeholderImage:nil options:SDWebImageLowPriority];
    _imgAvaterType.image = [UIImage imageNamed:userModel.verifiedImageUrl];
    
    _userLabel.text = userModel.name;
    _userLabel.sd_layout
    .widthIs(userModel.nameWidth);
    _imgVip.image = [UIImage imageNamed:_homeCellViewModel.mlevelImageUrl];
    
    _releaseTimeLab.text = _homeCellViewModel.timestamp;
    _releaseTimeLab.sd_layout
    .widthIs(_homeCellViewModel.timestampWidth);
    
    _releaseTerminal.text = _homeCellViewModel.statusModel.source;
    
}

@end
