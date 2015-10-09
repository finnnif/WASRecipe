//
//  WASTabBarController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/1.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASTabBarController.h"
#import "WASTabBar.h"
#import "WASNavigationController.h"

#import "WASHomePageController.h"
#import "WASMakertController.h"
#import "WASCommunityController.h"
#import "WASSelfController.h"

@interface WASTabBarController () <WASTabBarDelgate>

/** tabBarItem数组 */
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation WASTabBarController

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupChildViewController];
    
    [self setupTabBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 移除系统tabBar上自带的按钮
    for (UIView *childView in self.tabBar.subviews) {
        
        if (![childView isKindOfClass:[WASTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

#pragma mark - WASTabBarDelgate方法
- (void)tabBar:(WASTabBar *)tabBar didClickButtonOfIndex:(NSInteger)index
{
    // 切换控制器
    self.selectedIndex = index;
}

// 设置tabBar
- (void)setupTabBar
{
    // 添加自定义的tabBar
    WASTabBar *tabBar = [[WASTabBar alloc] init];
    
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor whiteColor];
    
    // 设置代理
    tabBar.delgate = self;
    
    // tabBar按钮的个数，由tabBar子控制器个数决定
    //    tabBar.count = (int)self.childViewControllers.count;
    // 传对应的子控制器tabBarItem数组
    tabBar.items = self.items;
    
    
    [self.tabBar addSubview:tabBar];
}

// 添加子控制器
- (void)setupChildViewController
{
    [self loadChildContorller:[[WASHomePageController alloc] init] image:@"xiachufang" selImage:@"xiachufang_selected" title:@"下厨房"];
    
    [self loadChildContorller:[[WASMakertController alloc] init] image:@"makert" selImage:@"makert_selected" title:@"市集"];
    
    [self loadChildContorller:[[WASCommunityController alloc] init] image:@"community" selImage:@"community_selected" title:@"社区"];
    
    [self loadChildContorller:[[WASSelfController alloc] init] image:@"self" selImage:@"self_selected" title:@"我"];
}


// 创建一个控制器, 添加tabBarController中
- (void)loadChildContorller:(UIViewController *)vc image:(NSString *)image selImage:(NSString *)selImage title:(NSString *)title
{
    // 设置导航条
    vc.view.backgroundColor = WASRandomColor;
    vc.title = title;
    
    // 设置按钮图片
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selImage];
    
    // 保存对应子控制器的UITabBarItem
    [self.items addObject:vc.tabBarItem];
    
    WASNavigationController *nv = [[WASNavigationController alloc] initWithRootViewController:vc];
    
    // 添加控制器到tabBarController中
    [self addChildViewController:nv];
}

#pragma mark 系统UITabBarButton点击触发事件
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"%ld", self.selectedIndex);
}

@end
