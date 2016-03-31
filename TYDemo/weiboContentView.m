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
#import "HZPhotoItem.h"
#import <HexColors.h>
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

   // self.backgroundColor = [UIColor yellowColor];
    _contentTYAttributedLab = [[TYAttributedLabel alloc]init];
        _contentTYAttributedLab.backgroundColor = [UIColor clearColor];
    _retweetedView = [UIView new];
    _retweetedView.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"f5f2f3"];
    _retweetedTYAttributedLab = [[TYAttributedLabel alloc]init];
    _retweetedTYAttributedLab.backgroundColor = [UIColor clearColor];
    _contentImageViewGroup = [[HZPhotoGroup alloc]init];
    
    [self addSubview:_contentTYAttributedLab];
    [self addSubview:_retweetedView];
    [_retweetedView addSubview:_retweetedTYAttributedLab];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)setHomeCellViewModel:(WBHomeCellViewModel *)homeCellViewModel {
    _homeCellViewModel = homeCellViewModel;
    
    _contentTYAttributedLab.textContainer = homeCellViewModel.textContainer;
    _contentTYAttributedLab.sd_layout
    .topEqualToView(self)
    .leftSpaceToView(self,CELL_SIDEMARGIN)
    .rightSpaceToView(self,CELL_SIDEMARGIN)
    .heightIs(homeCellViewModel.contentHeight);
    [self setupAutoHeightWithBottomView:_contentTYAttributedLab bottomMargin:5];
    //NSLog(@"contentHeight:%f",homeCellViewModel.contentHeight);
    if (homeCellViewModel.statusModel.retweeted_status!=nil)
    {
        _retweetedView.sd_layout
        .topSpaceToView(_contentTYAttributedLab,0)
        .leftEqualToView(self)
        .rightEqualToView(self);
        WBHomeCellViewModel *retweetedViewModel=homeCellViewModel.statusModel.retweeted_status;
        
        _retweetedTYAttributedLab.textContainer = retweetedViewModel.textContainer;
        _retweetedTYAttributedLab.sd_layout
        .topSpaceToView(_retweetedView,5)
        .leftSpaceToView(_retweetedView,15)
        .rightSpaceToView(_retweetedView,15)
        .heightIs(retweetedViewModel.contentHeight);
     
        if (retweetedViewModel.statusModel.pic_urls.count > 0) {
            [_retweetedView addSubview: _contentImageViewGroup];
            _contentImageViewGroup.sd_layout
            .topSpaceToView(_retweetedTYAttributedLab,10)
            .leftSpaceToView(_retweetedView,15)
            .rightSpaceToView(_retweetedView,15);
            NSMutableArray *temp = [NSMutableArray array];
            [retweetedViewModel.statusModel.pic_urls enumerateObjectsUsingBlock:^(NSString *url, NSUInteger idx, BOOL *stop) {
                HZPhotoItem *item = [[HZPhotoItem alloc] init];
                item.thumbnail_pic = url;
                [temp addObject:item];
            }];
            _contentImageViewGroup.photoItemArray = [temp copy];
            
            [_retweetedView setupAutoHeightWithBottomView:_contentImageViewGroup bottomMargin:10];
        }else {
            [_retweetedView setupAutoHeightWithBottomView:_retweetedTYAttributedLab bottomMargin:5];
        }
        [self setupAutoHeightWithBottomView:_retweetedView bottomMargin:0];
    }else {
        [_retweetedView removeFromSuperview];
        if (homeCellViewModel.statusModel.pic_urls.count > 0) {
            [self addSubview:_contentImageViewGroup];
            _contentImageViewGroup.sd_layout
            .topSpaceToView(_contentTYAttributedLab,5)
            .leftSpaceToView(self,15)
            .rightSpaceToView(self,15);
            NSMutableArray *temp = [NSMutableArray array];
            [homeCellViewModel.statusModel.pic_urls enumerateObjectsUsingBlock:^(NSString *url, NSUInteger idx, BOOL *stop) {
                HZPhotoItem *item = [[HZPhotoItem alloc] init];
                item.thumbnail_pic = url;
                [temp addObject:item];
            }];
            _contentImageViewGroup.photoItemArray = temp;
            [self setupAutoHeightWithBottomView:_contentImageViewGroup bottomMargin:0];
        }else {
            [self setupAutoHeightWithBottomView:_contentTYAttributedLab bottomMargin:0];
        }
    }
}

@end
