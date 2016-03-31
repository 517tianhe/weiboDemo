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
#import "weiboContentView.h"

#define CELL_HEADVIEW_HEIGHT 54.0    //头部高度
#define CELL_BOTTOM_HEIGHT   40.0    //底部固定高度

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
    weiboContentView * _WBContentView;

    /**
     *  微博底部视图
     */
    WBBottomView *_bottomView;
    
    UIView *_view;
    
    
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
    
    for (UIView *view in contentView.subviews) {
        [view removeFromSuperview];
    }
    
    
    _headView = [[WBHeadView alloc]init];
    [contentView addSubview:_headView];
    _headView.sd_layout
    .topEqualToView(contentView)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .heightIs(CELL_HEADVIEW_HEIGHT);
    
    _WBContentView = [[weiboContentView alloc]init];
    [contentView addSubview:_WBContentView];
    _WBContentView.sd_layout
    .topSpaceToView(_headView,0)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView);
    
    _bottomView = [[WBBottomView alloc]init];
    [contentView addSubview:_bottomView];
    _bottomView.sd_layout
    .topSpaceToView(_WBContentView,0)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .heightIs(CELL_BOTTOM_HEIGHT);
    
    [self setupAutoHeightWithBottomView:_bottomView bottomMargin:0];
}

- (void)setHomeCellViewModel:(WBHomeCellViewModel *)homeCellViewModel {
    _homeCellViewModel = homeCellViewModel;
    [self setup];
    _headView.homeCellViewModel = homeCellViewModel;
    _bottomView.homeCellViewModel = homeCellViewModel;
    _WBContentView.homeCellViewModel = homeCellViewModel;
    
}

@end
