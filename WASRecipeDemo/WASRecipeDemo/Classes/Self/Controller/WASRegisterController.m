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
    self.title = @"手机注册";
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    
    leftButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [leftButton setTitleColor:WASCommonRedColor forState:UIControlStateNormal];
    [leftButton setTitleColor:WASCommonTranslucentRedColor forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [leftButton sizeToFit];
    leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
