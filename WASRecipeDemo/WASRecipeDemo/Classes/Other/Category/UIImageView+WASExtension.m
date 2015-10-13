//
//  UIImageView+WASExtension.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/13.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "UIImageView+WASExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (WASExtension)

// 设置头像
- (void)setupHeaderFromURL:(NSString *)URL
{
    [self setupCircleHeaderFromURL:URL];
}

// 设矩形头像
- (void)setupRectHeaderFromURL:(NSString *)URL
{
    [self sd_setImageWithURL:[NSURL URLWithString:URL] placeholderImage:[UIImage imageNamed:@"pudding"]];
}

// 设置圆形头像
- (void)setupCircleHeaderFromURL:(NSString *)URL
{
    WASWeakSelf;
    [self sd_setImageWithURL:[NSURL URLWithString:URL] placeholderImage:[[UIImage imageNamed:@"defaultUserIcon"] circleImage] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 如果图片下载失败,就不做处理
        if (!image) return;
        // 把图片剪裁成圆形
        weakSelf.image = [image circleImage];
    }];
}


@end
