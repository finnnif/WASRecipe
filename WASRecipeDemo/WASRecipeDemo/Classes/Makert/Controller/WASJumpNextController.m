//
//  WASCategoryController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/20.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASJumpNextController.h"
#import "WASGoodController.h"

@interface WASJumpNextController ()<UIWebViewDelegate>

/** 网页视图 */
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation WASJumpNextController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.webView) return;
    [self setupWebView];
}

- (void)setupWebView
{
    UIWebView *wv = [[UIWebView alloc] initWithFrame:self.view.bounds];
    wv.backgroundColor = WASCommonBgColor;
    wv.delegate = self;
    [wv loadRequest:[NSURLRequest requestWithURL:self.jumpURL]];
    [self.view addSubview:wv];
    self.webView = wv;

}


#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        
        if ( [[request.URL absoluteString] hasPrefix:@"http://www.xiachufang.com/page/shop-home/"] ||
            [[request.URL absoluteString] hasPrefix:@"https://www.xiachufang.com/page/shop-home/"] ||
            [[request.URL absoluteString] hasPrefix:@"http://www.xiachufang.com/page/goods-category/"] ||
            [[request.URL absoluteString] hasPrefix:@"https://www.xiachufang.com/page/goods-category/"]
            ) {
            
            WASJumpNextController *categoryVc = [[WASJumpNextController alloc] init];
            categoryVc.jumpURL = request.URL;
            
            [self.navigationController pushViewController:categoryVc animated:YES];
            
        } else if ([[request.URL absoluteString] hasPrefix:@"http://www.xiachufang.com/goods/"] ||
                   [[request.URL absoluteString] hasPrefix:@"https://www.xiachufang.com/goods/"])
        {
            WASGoodController *goodVc = [[WASGoodController alloc] init];
            
            [self.navigationController pushViewController:goodVc animated:YES];
        }
        return NO;
    }
    return YES;
}

@end
