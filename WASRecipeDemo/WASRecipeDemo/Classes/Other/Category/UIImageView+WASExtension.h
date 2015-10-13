//
//  UIImageView+WASExtension.h
//  WASRecipeDemo
//
//  Created by sanking on 15/10/13.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WASExtension)

- (void)setupHeaderFromURL:(NSString *)URL;

// 设置矩形图标
- (void)setupRectHeaderFromURL:(NSString *)URL;

// 设置圆形头像
- (void)setupCircleHeaderFromURL:(NSString *)URL;
@end
