//
//  UIButton+WSExtension.m
//  下厨房demo
//
//  Created by xmg1 on 15/9/3.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "UIButton+WASExtension.h"

@implementation UIButton (WASExtension)

+ (instancetype)buttonWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action
{
    // 创建button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 设置图片
    [button setImage:imageName highImage:highImageName];
    
    // 设置按钮尺寸
    [button sizeToFit];
    
    // 添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (instancetype)setImage:(NSString *)image highImage:(NSString *)highImage
{
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    return self;
}

@end
