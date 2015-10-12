//
//  WASShoppingBasketController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/11.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASShoppingBasketController.h"

@interface WASShoppingBasketController ()

@end

@implementation WASShoppingBasketController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
}

- (void)setupNav
{
    // 设置标题文字
    UILabel *label = [[UILabel alloc] init];
    label.text = @"菜篮子";
    label.font = [UIFont systemFontOfSize:18];
    [label sizeToFit];
    label.textColor = WASTextGrayColor;
    self.navigationItem.titleView = label;
    
    // 设置右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"清空" itemEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10) target:self action:@selector(clear)];
}


- (void)clear
{
    NSLog(@"%s", __func__);
}

@end
