//
//  photoTableViewController.m
//  TYDemo
//
//  Created by wanglj on 16/3/30.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "photoTableViewController.h"

#import <UIView+SDAutoLayout.h>
#import <UITableView+SDAutoTableViewCellHeight.h>
#import "phTableViewCell.h"

static NSString *identdf = @"phcell";

@interface photoTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation photoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableview = [[UITableView alloc]init];
    [self.view addSubview:tableview];
    tableview.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.rowHeight = 380;
    [tableview registerClass:[phTableViewCell class] forCellReuseIdentifier:identdf];
 }
    // Do any additional setup after loading the view.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    phTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identdf];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
