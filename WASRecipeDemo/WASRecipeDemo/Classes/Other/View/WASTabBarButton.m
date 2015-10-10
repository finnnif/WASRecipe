//
//  WASTabBarButton.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/8.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASTabBarButton.h"

@implementation WASTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
        [self setTitleColor:WASCommonGrayColor forState:UIControlStateNormal];
        
        [self setTitleColor:WASCommonRedColor forState:UIControlStateSelected];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.height = WASTabBarItemImageHeight;
    self.imageView.width = self.imageView.height;
    self.imageView.y = WASCommonSmallMargin;
    self.imageView.centerX = self.width * 0.5;
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}

- (void)setHighlighted:(BOOL)highlighted {
    
}


@end
