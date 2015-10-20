//
//  WASMakertController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/9.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASMakertController.h"
#import "WASJumpNextController.h"
#import "WASGoodController.h"

@interface WASMakertController ()<UIWebViewDelegate>

/** 网页 */
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation WASMakertController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHUD];
    [self setupNav];
    [self setupWebView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)setupHUD
{

}

// 设置导航栏
- (void)setupNav
{
    // 设置右边的item
    UIBarButtonItem *categoryItem = [UIBarButtonItem itemWithTitle:@"分类" itemEdgeInsets:UIEdgeInsetsMake(0, -7, 0, 0) target:self action:@selector(categoryItemOnCilck)];
    self.navigationItem.leftBarButtonItem = categoryItem;
    
    // 设置右边的item
    UIBarButtonItem *cartItem = [UIBarButtonItem itemWithImage:@"cart" highImage:nil target:self action:@selector(cartItemOnCilck)];
    self.navigationItem.rightBarButtonItem = cartItem;
    
}

- (void)categoryItemOnCilck
{
    WASJumpNextController *categoryVc = [[WASJumpNextController alloc] init];
    
    categoryVc.jumpURL = [NSURL URLWithString:@"https://www.xiachufang.com/page/goods-category/"];
    
    [self.navigationController pushViewController:categoryVc animated:YES];
}

- (void)cartItemOnCilck
{

}

- (void)setupWebView
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.backgroundColor = WASCommonBgColor;
    self.webView = webView;
    self.webView.delegate = self;
    [self.view addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.xiachufang.com/page/ec-tab/?version=12"]];
    [webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        
        if ([[request.URL absoluteString] hasPrefix:@"http://www.xiachufang.com/page/goods-category/"]||
            [[request.URL absoluteString] hasPrefix:@"https://www.xiachufang.com/page/goods-category/"] ||
            [[request.URL absoluteString] hasPrefix:@"http://www.xiachufang.com/page/shop-home/"] ||
            [[request.URL absoluteString] hasPrefix:@"http://www.xiachufang.com/page/ec-outlet/"] ||
            [[request.URL absoluteString] hasPrefix:@"https://www.xiachufang.com/page/ec-outlet/"] ||
            [[request.URL absoluteString] hasPrefix:@"http://www.xiachufang.com/page/ec/manageable_stand/"] ||
            [[request.URL absoluteString] hasPrefix:@"https://www.xiachufang.com/ad/latest-goods/"]
            ) {
            
            WASJumpNextController *jumpNextVc = [[WASJumpNextController alloc] init];
            jumpNextVc.jumpURL = request.URL;
            
            [self.navigationController pushViewController:jumpNextVc animated:YES];
            
        } else if ([[request.URL absoluteString] hasPrefix:@"https://www.xiachufang.com/goods/"])
        {
            WASGoodController *goodVc = [[WASGoodController alloc] init];
            
            [self.navigationController pushViewController:goodVc animated:YES];
        }
        return NO;
    }
    return YES;
}

@end
