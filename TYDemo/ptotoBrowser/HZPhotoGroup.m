//
//  HZPhotoGroup.m
//  HZPhotoBrowser
//
//  Created by aier on 15-2-4.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "HZPhotoGroup.h"
#import "HZPhotoItemView.h"
#import "HZPhotoItem.h"
#import <UIImageView+WebCache.h>
#import "HZPhotoBrowser.h"
#import <UIView+SDAutoLayout.h>
#import "HZPhotoBrowserConfig.h"
#define HZPhotoGroupImageMargin 15

@interface HZPhotoGroup () <HZPhotoBrowserDelegate>

@end

@implementation HZPhotoGroup 

- (instancetype)init {
    self = [super init];
    if (self) {
        //[[SDWebImageManager sharedManager].imageCache clearDisk];
        _itemWidth  = (SCREEN_WIDTH-30 - HZPhotoBrowserImageViewMargin*2)/3;
    }
    return self;
}

- (void)setPhotoItemArray:(NSArray *)photoItemArray
{
    _photoItemArray = photoItemArray;
    if (photoItemArray.count == 1) {
        HZPhotoItem *obj = photoItemArray[0];
        HZPhotoItemView *itemView = [[HZPhotoItemView alloc]init];
        //让图片不变形，以适应按钮宽高，按钮中图片部分内容可能看不到
        itemView.photo.contentMode = UIViewContentModeScaleAspectFill;
        itemView.clipsToBounds = YES;
        [itemView.photo sd_setImageWithURL:[NSURL URLWithString:obj.thumbnail_pic]  placeholderImage:[UIImage imageNamed:@"whiteplaceholder"]];
        itemView.btn.tag = 0;
        [itemView.btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:itemView];
        itemView.sd_layout
        .topEqualToView(self)
        .leftEqualToView(self)
        .widthRatioToView(self,0.5)
        .heightEqualToWidth();
        [self setupAutoHeightWithBottomView:itemView bottomMargin:0];
        
    }else {
        __block UIView *leftView = self;
        __block UIView *topView = self;
     //   NSLog(@"%f",CGRectGetWidth(self.frame));
        [photoItemArray enumerateObjectsUsingBlock:^(HZPhotoItem *obj, NSUInteger idx, BOOL *stop) {
            HZPhotoItemView *itemView = [[HZPhotoItemView alloc]init];
            
            //让图片不变形，以适应按钮宽高，按钮中图片部分内容可能看不到
            itemView.photo.contentMode = UIViewContentModeScaleAspectFill;
            itemView.clipsToBounds = YES;
            
            [itemView.photo sd_setImageWithURL:[NSURL URLWithString:obj.thumbnail_pic]  placeholderImage:[UIImage imageNamed:@"whiteplaceholder"]];
            itemView.btn.tag = idx;
            
            [itemView.btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:itemView];
            if (idx == 0) {
                itemView.sd_layout
                .topSpaceToView(topView,0)
                .leftSpaceToView(leftView,0)
                .widthIs(_itemWidth)
                .heightEqualToWidth();
                leftView = itemView;
            }else if ((idx+1)%3 == 0) {
                itemView.sd_layout
                .topEqualToView(leftView)
                .leftSpaceToView(leftView,HZPhotoBrowserImageViewMargin)
                .widthIs(_itemWidth)
                .heightEqualToWidth();
                leftView = self;
                topView = itemView;
            }else if ((idx+1)%3 == 1){
                itemView.sd_layout
                .topSpaceToView(topView,HZPhotoBrowserImageViewMargin)
                .leftSpaceToView(leftView,0)
                .widthIs(_itemWidth)
                .heightEqualToWidth();
                leftView = itemView;
            }else {
                itemView.sd_layout
                .topEqualToView(leftView)
                .leftSpaceToView(leftView,HZPhotoBrowserImageViewMargin)
                .widthIs(_itemWidth)
                .heightEqualToWidth();
                leftView = itemView;
            }
           [self setupAutoHeightWithBottomView:itemView bottomMargin:0];
        }];
    }

}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    long imageCount = self.photoItemArray.count;
//    int perRowImageCount = ((imageCount == 4) ? 2 : 3);
//    CGFloat perRowImageCountF = (CGFloat)perRowImageCount;
//    int totalRowCount = ceil(imageCount / perRowImageCountF); // ((imageCount + perRowImageCount - 1) / perRowImageCount)
//    CGFloat w = 80;
//    CGFloat h = 80;
//    [self.subviews enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
//        
//        long rowIndex = idx / perRowImageCount;
//        int columnIndex = idx % perRowImageCount;
//        CGFloat x = columnIndex * (w + HZPhotoGroupImageMargin);
//        CGFloat y = rowIndex * (h + HZPhotoGroupImageMargin);
//        btn.frame = CGRectMake(x, y, w, h);
//    }];
//
//    self.frame = CGRectMake(10, 10, 280, totalRowCount * (HZPhotoGroupImageMargin + h));
}

- (void)buttonClick:(UIButton *)button
{
    //启动图片浏览器
    HZPhotoBrowser *browser = [[HZPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = self; // 原图的父控件
    browser.imageCount = self.photoItemArray.count; // 图片总数
    browser.currentImageIndex = (int)button.tag;
    browser.delegate = self;
    [browser show];
    
}

#pragma mark - photobrowser代理方法

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(HZPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    HZPhotoItemView *itemView = self.subviews[index];
    return itemView.photo.image;
}


// 返回高质量图片的url
- (NSURL *)photoBrowser:(HZPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *urlStr = [[self.photoItemArray[index] thumbnail_pic] stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
    return [NSURL URLWithString:urlStr];
}

@end
