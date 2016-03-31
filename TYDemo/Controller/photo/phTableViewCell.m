//
//  phTableViewCell.m
//  TYDemo
//
//  Created by wanglj on 16/3/30.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "phTableViewCell.h"
#import <UIView+SDAutoLayout.h>
#import "HZPhotoGroup.h"
#import "HZPhotoItem.h"
@interface phTableViewCell ()
@property (nonatomic, strong) NSArray *srcStringArray;

@end

@implementation phTableViewCell

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
        _srcStringArray = @[
                            @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                            @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                            @"http://ww4.sinaimg.cn/thumbnail/9e9cb0c9jw1ep7nlyu8waj20c80kptae.jpg",
                            @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1xydcj20gy0o9q6s.jpg",
                            @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                            @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
                            @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg",
                            @"http://ww2.sinaimg.cn/thumbnail/677febf5gw1erma104rhyj20k03dz16y.jpg",
                            @"http://ww4.sinaimg.cn/thumbnail/677febf5gw1erma1g5xd0j20k0esa7wj.jpg"
                            ];
        [self setup];
    }
    return self;
}


- (void)setup {
    HZPhotoGroup *photoGroup = [[HZPhotoGroup alloc] init];
    
    NSMutableArray *temp = [NSMutableArray array];
    [_srcStringArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
        HZPhotoItem *item = [[HZPhotoItem alloc] init];
        item.thumbnail_pic = src;
        [temp addObject:item];
    }];

    [self.contentView addSubview:photoGroup];
    photoGroup.sd_layout
    .topEqualToView(self.contentView)
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15);
    NSLog(@"%f",CGRectGetWidth(photoGroup.frame));
    //photoGroup.itemWidth = 20;
    photoGroup.photoItemArray = [temp copy];
    //photoGroup.backgroundColor = [UIColor blueColor];
    
    

}


@end
