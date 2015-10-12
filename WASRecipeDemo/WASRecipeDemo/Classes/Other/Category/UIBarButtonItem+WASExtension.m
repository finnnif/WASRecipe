//
//  UIBarButtonItem+WASExtension.m
//  下厨房demo
//
//  Created by sanking on 15/9/3.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "UIBarButtonItem+WASExtension.h"

@implementation UIBarButtonItem (WASExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    if (highImage) {
        [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)itemWithTitle:(NSString *)title itemEdgeInsets:(UIEdgeInsets)itemEdgeInsets target:(id)target action:(SEL)action
{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    [item setTitle:title forState:UIControlStateNormal];
    
    item.titleLabel.font = [UIFont systemFontOfSize:17];
    [item setTitleColor:WASCommonRedColor forState:UIControlStateNormal];
    [item setTitleColor:WASCommonTranslucentRedColor forState:UIControlStateHighlighted];
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (![NSStringFromUIEdgeInsets(itemEdgeInsets) isEqualToString:NSStringFromUIEdgeInsets(UIEdgeInsetsZero)]) {
        
        item.contentEdgeInsets = itemEdgeInsets;
    }
    
    [item sizeToFit];

    return [[UIBarButtonItem alloc] initWithCustomView:item];
}

@end
