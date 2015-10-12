//
//  WASHomePageController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/9.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASHomePageController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "WASPopList.h"
#import "WASShoppingBasketController.h"
#import "WASListItemCell.h"

@interface WASHomePageController ()

/** AFN管理者 */
@property (nonatomic, weak) AFHTTPSessionManager *manager;

/** 菜单模型数组 */
@property (nonatomic, strong) NSArray *listItems;

@end

@implementation WASHomePageController

// 重用标识
NSString * const WASListId = @"listItem";

#pragma mark - lazy
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

//- (NSArray *)listItems
//{
//    if (!_listItems) {
//        
//        _listItems = [WASListItem objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"lists" ofType:@"plist"]]];
//    }
//    return _listItems;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadHomeData];
//    NSLog(@"%@", NSHomeDirectory());
    [self setupTableView];

    [self setupNav];

}

- (void)loadHomeData
{
    // 取消之前的所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"timezone"] = @"Asia/Shanghai";
    params[@"api_key"] = @"0f9f79be1dac5f003e7de6f876b17c00";
    params[@"api_sign"] = @"c6a8015431d56f800c519dfa5c610fcd";
    params[@"version"] = @"4.4.0";
    params[@"origin"] = @"iphone";
    
    WASWeakSelf;
    // 发送请求
    [self.manager GET:WASRequestURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WSWriteToPlist(responseObject[@"content"], @"首页数据.plist");
        weakSelf.listItems = [WASPopList objectArrayWithKeyValuesArray:responseObject[@"content"][@"pop_lists"][@"lists"]];
        // 刷新表格
        [weakSelf.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"没有网络啊,亲~~~~~");
    }];
}

- (void)setupTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WASListItemCell class]) bundle:nil] forCellReuseIdentifier:WASListId];
    
    self.tableView.rowHeight = 100;
    
    
//    self.tableView.estimatedRowHeight = 100;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView reloadData];
}

// 设置导航栏
- (void)setupNav
{
    // 设置左边的item
    UIBarButtonItem *buyListItem = [UIBarButtonItem itemWithImage:@"buy_list_button" highImage:nil target:self action:@selector(buyListItemOnCilck)];
    self.navigationItem.rightBarButtonItem = buyListItem;

}

// 点击标签按钮
- (void)buyListItemOnCilck
{
    WASShoppingBasketController *tc = [[WASShoppingBasketController alloc] init];

    [self.navigationController pushViewController:tc animated:YES];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.listItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WASListItemCell *cell = [tableView dequeueReusableCellWithIdentifier:WASListId];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.listItem = self.listItems[indexPath.row];
    
//    WASLog(@"%@", cell);
    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
