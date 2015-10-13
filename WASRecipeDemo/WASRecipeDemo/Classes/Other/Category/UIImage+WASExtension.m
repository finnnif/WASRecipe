//
//  UIImage+WSExtension.m
//  百思不得姐demo
//
//  Created by xmg1 on 15/9/8.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "UIImage+WASExtension.h"

@implementation UIImage (WSExtension)

- (instancetype)circleImage
{
    // 开启图片上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 绘制矩形
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // 在矩形中添加一个圆内切圆
    CGContextAddEllipseInRect(ctx, rect);
    
    // 剪裁成圆
    CGContextClip(ctx);
    
    // 往圆上画图片
    [self drawInRect:rect];
    
    // 获得上下文中画好的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)circleImageName:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}


@end
