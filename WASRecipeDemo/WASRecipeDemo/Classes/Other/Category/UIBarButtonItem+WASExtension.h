//
//  UIBarButtonItem+WASExtension.h
//  下厨房demo
//
//  Created by sanking on 15/9/3.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XMGExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
