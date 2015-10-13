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
#import "WASShoppingBasketController.h"

#import "WASPopList.h"
#import "WASPopRecipeList.h"
#import "WASPopRecipeListCell.h"
#import "WASPopListCell.h"

@interface WASHomePageController ()

/** AFN管理者 */
@property (nonatomic, weak) AFHTTPSessionManager *manager;

/** 榜单菜单模型数组 */
@property (nonatomic, strong) NSArray *listItems;

/** 流行菜单模型数组 */
@property (nonatomic, strong) NSArray *popLists;

@end

@implementation WASHomePageController

// 重用标识
NSString * const WASPopListId = @"popList";
NSString * const WASListItemId = @"listItem";

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
    
    //    NSLog(@"%@", NSHomeDirectory());
    [self loadHomeData];
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
        
        weakSelf.listItems = [WASPopList objectArrayWithKeyValuesArray:responseObject[@"content"][@"pop_list"][@"lists"]];
        weakSelf.popLists = [WASPopRecipeList objectArrayWithKeyValuesArray:responseObject[@"content"][@"pop_recipe_lists"][@"recipe_lists"]];
        
        // 刷新表格
        [weakSelf.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"没有网络啊,亲~~~~~");
    }];
}

- (void)setupTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WASPopListCell class]) bundle:nil] forCellReuseIdentifier:WASListItemId];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WASPopList class]) bundle:nil] forCellReuseIdentifier:WASPopListId];
    
    self.tableView.rowHeight = 80;
    
//    self.tableView.estimatedRowHeight = 100;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.backgroundColor = WASCommonBgColor;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.popLists.count;
    }
    else {
    return self.listItems.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        WASPopListCell *cell = [tableView dequeueReusableCellWithIdentifier:WASListItemId];
        
        cell.listItem = self.listItems[indexPath.row];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = self.tableView.backgroundColor;
    }
    WASPopListCell *cell = [tableView dequeueReusableCellWithIdentifier:WASListItemId];
    
    cell.listItem = self.listItems[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = WASCommonBgColor;
    
    return cell;
}

// 设置组头视图
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return ;
//}

// 设置组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"榜单";
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __func__);
}

@end
