//
//  weiboTableViewCell.m
//  TYDemo
//
//  Created by wanglj on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "weiboTableViewCell.h"
#import <UIView+SDAutoLayout.h>
#import <TYAttributedLabel.h>
#import "WBHeadView.h"
#import "WBBottomView.h"
#import "HZPhotoGroup.h"

#define CELL_HEADVIEW_HEIGHT 54.0    //头部高度
#define CELL_BOTTOM_HEIGHT   50.0    //底部固定高度

@interface weiboTableViewCell ()<TYAttributedLabelDelegate>

@end


@implementation weiboTableViewCell{
    /**
     *  微博头视图
     */
    WBHeadView *_headView;
    /**
     *  微博消息中的所有内容
     */
    UIView * _WBContentView;
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
    /**
     *  微博底部视图
     */
    WBBottomView *_bottomView;
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup {
    UIView *contentView = self.contentView;
    
    _headView = [[WBHeadView alloc]init];
    [contentView addSubview:_headView];
    _headView.sd_layout
    .topEqualToView(contentView)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .heightIs(CELL_HEADVIEW_HEIGHT);
    
    _bottomView = [[WBBottomView alloc]init];
    [contentView addSubview:_bottomView];
    _bottomView.sd_layout
    .bottomEqualToView(contentView)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .heightIs(CELL_BOTTOM_HEIGHT);
    
    _WBContentView = [[UIView alloc]init];
    [contentView addSubview:_WBContentView];
    _WBContentView.sd_layout
    .topSpaceToView(_headView,10)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .bottomSpaceToView(_bottomView,0);
    
    [contentView setupAutoHeightWithBottomView:_bottomView bottomMargin:0];
    
}

- (void)setHomeCellViewModel:(WBHomeCellViewModel *)homeCellViewModel {
    _homeCellViewModel = homeCellViewModel;
    
    _headView.homeCellViewModel = homeCellViewModel;
    _bottomView.homeCellViewModel = homeCellViewModel;
    
    UIView *blockView = [UIView new];
    blockView.backgroundColor = [UIColor redColor];
    [_WBContentView addSubview:blockView];
    blockView.sd_layout
    .topEqualToView(_WBContentView)
    .leftEqualToView(_WBContentView)
    .rightEqualToView(_WBContentView)
    .heightIs(100);
    [_WBContentView setupAutoHeightWithBottomView:blockView bottomMargin:10];
}

@end
