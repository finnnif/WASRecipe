//
//  WASRegisterController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/10.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASRegisterController.h"

@interface WASRegisterController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation WASRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupScr];
    [self setupNav];
    

}

- (void)setupScr
{
//    self.scrollView.alwaysBounceVertical = YES;
}

// 设置导航条
- (void)setupNav
{
    // 设置标题文字
    UILabel *label = [[UILabel alloc] init];
    label.text = @"手机注册";
    label.font = [UIFont systemFontOfSize:18];
    [label sizeToFit];
    label.textColor = WASTextGrayColor;
    self.navigationItem.titleView = label;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"取消" itemEdgeInsets:UIEdgeInsetsMake(0, -7, 0, 0) target:self action:@selector(cancel)];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
