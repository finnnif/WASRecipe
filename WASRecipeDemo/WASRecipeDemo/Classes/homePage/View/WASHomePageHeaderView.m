//
//  WASHomePageHeaderView.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/18.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASHomePageHeaderView.h"
#import <AFNetworking.h>

@interface WASHomePageHeaderView ()

/** AFN管理者 */
@property (nonatomic, weak) AFHTTPSessionManager *manager;

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;

@end

@implementation WASHomePageHeaderView

#pragma mark - lazy
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)awakeFromNib
{
    [self loadHomeData];
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
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           
            [weakSelf.leftImageView setupRectHeaderFromURL:responseObject[@"content"][@"pop_recipe_picurl"]];
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"没有网络啊,亲~~~~~");
    }];
}

@end
