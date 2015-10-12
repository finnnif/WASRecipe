//
//  UIBarButtonItem+WASExtension.h
//  下厨房demo
//
//  Created by sanking on 15/9/3.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WASExtension)

/** 按照图片创建UIBarButtonItem */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

/** 按照文字创建UIBarButtonItem(可修改偏移) */
+ (instancetype)itemWithTitle:(NSString *)title itemEdgeInsets:(UIEdgeInsets)itemEdgeInsets target:(id)target action:(SEL)action;

@end
