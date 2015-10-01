//
//  UIButton+WSExtension.m
//  下厨房demo
//
//  Created by xmg1 on 15/9/3.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "UIButton+WASExtension.h"

@implementation UIButton (WASExtension)

+ (instancetype)buttonWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    // 创建item
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置按钮尺寸
    [btn sizeToFit];
    
    // 添加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (instancetype)setImage:(NSString *)image highImage:(NSString *)highImage
{
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    return self;
}

@end
