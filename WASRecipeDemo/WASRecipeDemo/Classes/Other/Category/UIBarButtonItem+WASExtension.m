//
//  UIBarButtonItem+WASExtension.m
//  下厨房demo
//
//  Created by sanking on 15/9/3.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "UIBarButtonItem+WASExtension.h"

@implementation UIBarButtonItem (XMGExtension)

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
@end
