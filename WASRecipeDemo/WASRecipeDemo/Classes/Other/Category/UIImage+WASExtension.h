//
//  UIImage+WSExtension.h
//  百思不得姐demo
//
//  Created by xmg1 on 15/9/8.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WASExtension)

// 通过一张图片(针对正方形图片),返回一张圆形图片
- (instancetype)circleImage;

// 通过一个字符串创建一张圆形图片
+ (instancetype)circleImageName:(NSString *)name;

@end
