//
//  weiboTableView.m
//  TYDemo
//
//  Created by wanglj on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "weiboTableView.h"
#import "weiboTableViewCell.h"
#import <UITableView+SDAutoTableViewCellHeight.h>
static NSString *kidentifier=@"WBTableViewCell";
@interface weiboTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation weiboTableView

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
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor= [UIColor blueColor];
        [self registerClass:[weiboTableViewCell class] forCellReuseIdentifier:kidentifier];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _weiboArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    WBHomeCellViewModel *homeCellViewModel = _weiboArray[indexPath.section];
//    return [tableView cellHeightForIndexPath:indexPath model:homeCellViewModel keyPath:@"homeCellViewModel" cellClass:[weiboTableViewCell class] contentViewWidth:SCREEN_WIDTH];
    return 250;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%li",(long)indexPath.section);
    WBHomeCellViewModel *homeCellViewModel = _weiboArray[indexPath.section];
    weiboTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kidentifier];
    cell.homeCellViewModel=homeCellViewModel;
    return cell;
}



@end
