//
//  WBStatusModel.m
//  TYDemo
//
//  Created by wanglj on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "WBStatusModel.h"

@implementation WBStatusModel

- (NSMutableArray *)pic_urls {
    if (_pic_urls) {
        NSMutableArray *urlArray = [NSMutableArray array];
        for (NSDictionary *dic in _pic_urls) {
            NSString *url = dic[@"thumbnail_pic"];
            if (![url hasSuffix:@".gif"]) {
                url = [url stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
            }
            [urlArray addObject:url];
        }
        return urlArray;
    }
    else {
        _pic_urls = [NSMutableArray array];
    }
    return _pic_urls;
}

@end
