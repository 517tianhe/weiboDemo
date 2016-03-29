//
//  ViewController.m
//  TYDemo
//
//  Created by wanglj on 16/3/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ViewController.h"
#import "TYAttributedLabel.h"
#import "UIView+SDAutoLayout.h"
#import <MJRefresh.h>
#import "UIView+ShortCut.h"
#import "weiboTableView.h"
#import "weiboManage.h"
#import <SVProgressHUD.h>

@interface ViewController ()
@property (nonatomic) weiboTableView *tableView;

@property (nonatomic ,assign)NSInteger page;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self weiboTableViewInit];
    //[self uiSet];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)weiboTableViewInit {
    _tableView = [[weiboTableView alloc]init];
    [self.view addSubview:_tableView];
    _tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
    //下拉刷新控件
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefreshLoading)];
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefreshLoading)];
    // 设置了底部inset
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    // 忽略掉底部inset
    self.tableView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
}

/**
 *  下拉刷新
 */
- (void)downRefreshLoading {
    self.page = 1;
    self.tableView.mj_footer.hidden = YES;
    [self loadData:YES];
}
/**
 *  上拉加载更多
 */
- (void)upRefreshLoading {
    [self loadData:NO];
}

#pragma 加载数据
-(void)loadData:(BOOL)isHeader
{
    [[weiboManage shardWeiBOManage]requestWeiBo:_page requestResult:^(BOOL result, NSMutableArray *array) {
        
        if (result) {
            if (isHeader) {
                _tableView.weiboArray = array;
            }else {
                [_tableView.weiboArray addObjectsFromArray:array];
            }
            _page++;
            if (array.count>=1000) {
                _tableView.mj_footer.hidden = YES;
            }else {
                _tableView.mj_footer.hidden = NO;
            }
        }else {
            [SVProgressHUD showErrorWithStatus:@"失败"];
        }
        if (isHeader) {
            [_tableView.mj_header endRefreshing];
        }else {
            [_tableView.mj_footer endRefreshing];
        }
        [_tableView reloadData];
    }];
}

@end
