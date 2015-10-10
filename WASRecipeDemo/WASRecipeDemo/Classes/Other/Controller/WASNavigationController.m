//
//  WASNavigationController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/1.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASNavigationController.h"

@interface WASNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation WASNavigationController

+ (void)initialize
{
    /** 设置UINavigationBar */
    // 拿到appearance单例
    UINavigationBar *bar = [UINavigationBar appearance];
    
    // 设置背景
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//    [bar setBackgroundColor:[UIColor whiteColor]];
    
    // 设置标题文字
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [bar setTitleTextAttributes:attrs];
    
    /** 设置UIBarButtonItem */
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // UIControlStateNormal状态
    NSMutableDictionary *norAttrs = [NSMutableDictionary dictionary];
    norAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    norAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:norAttrs forState:UIControlStateNormal];
    
    // UIControlStateDisabled状态
    NSMutableDictionary *disAttrs = [NSMutableDictionary dictionary];
    disAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    disAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:disAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置控制器为手势的代理
    self.interactivePopGestureRecognizer.delegate = self;
    
}

/**
 *  拦截所有push进来的控制器
 *
 *  @param viewController push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count >= 1) {
        
//        UIBarButtonItem *backButton = [UIBarButtonItem itemWithImage:@"ic_back" highImage:nil target:self action:@selector(back)];
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        // 隐藏底部tabar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // super的push方法要放在后面
    // 一旦调用了super的push方法, 就会创建控制器, 就会调用viewDidLoad方法
    // 一旦视图加载就不能达到if判断有效
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}
@end
