//
//  WASHomePageController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/9.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASHomePageController.h"
#import "WASShoppingBasketController.h"

@interface WASHomePageController ()

@end

@implementation WASHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:@"123"];
    
    [self setupNav];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
