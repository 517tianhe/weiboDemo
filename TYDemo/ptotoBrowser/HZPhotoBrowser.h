//
//  HZPhotoBrowser.h
//  photobrowser
//
//  Created by aier on 15-2-3.
//  Copyright (c) 2015年 aier. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HZButton, HZPhotoBrowser;

@protocol HZPhotoBrowserDelegate <NSObject>

@required

- (UIImage *)photoBrowser:(HZPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index;


@optional

- (NSURL *)photoBrowser:(HZPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index;

@end


@interface HZPhotoBrowser : UIView <UIScrollViewDelegate>
/**
 *  原图片的视图
 */
@property (nonatomic, weak) UIView *sourceImagesContainerView;
/**
 *  选中图片的编号
 */
@property (nonatomic, assign) int currentImageIndex;
/**
 *  图片总数
 */
@property (nonatomic, assign) NSInteger imageCount;

@property (nonatomic, weak) id<HZPhotoBrowserDelegate> delegate;

- (void)show;

@end
