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

@interface weiboTableViewCell ()<TYAttributedLabelDelegate>

@end


@implementation weiboTableViewCell{
    /**
     *  微博头视图
     */
    WBHeadView *_headView;
    /**
     *  微博消息内容
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
    
}

- (void)setHomeCellViewModel:(WBHomeCellViewModel *)homeCellViewModel {
    
}

@end
