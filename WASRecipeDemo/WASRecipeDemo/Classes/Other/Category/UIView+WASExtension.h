//
//  UIView+WSExtension.h
//  下厨房demo
//
//  Created by xmg1 on 15/9/5.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WASExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

// 从xib加载view
+ (instancetype)viewFromXib;
@end
