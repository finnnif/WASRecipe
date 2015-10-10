//
//  WASTabBar.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/1.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASTabBar.h"
#import "WASTabBarButton.h"
#import "WASLoginRegisterController.h"

//自定义TabBar的实现
@interface WASTabBar()

/** 之前选中的按钮 */
@property (nonatomic, weak) WASTabBarButton *selectedBtn;

@end

@implementation WASTabBar

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UITabBarItem *item in items) {

        WASTabBarButton *button = [WASTabBarButton buttonWithType:UIButtonTypeCustom];
        [button setImage:item.image forState:UIControlStateNormal];
        [button setImage:item.selectedImage forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        
        button.tag = self.subviews.count;
        
        if (self.subviews.count == 0) {
            [self buttonClick:button];
        }
        [button setTitle:item.title forState:UIControlStateNormal];
        
        [self addSubview:button];
    }
}

- (void)buttonClick:(WASTabBarButton *)button {
    
    if (button.tag == 3) {
        
        // 弹出登陆控制器
#warning <#message#>
        [self.window.rootViewController presentViewController:[[WASLoginRegisterController alloc] init] animated:YES completion:^{
            
        }];
        return;
    }
    // 1.去除以前选中
    _selectedBtn.selected = NO;
    
    // 2.设置当前选中
    button.selected = YES;
    
    // 3.设置当前点击按钮为选中按钮
    _selectedBtn = button;
    
    // 4.通知代理点击了哪个按钮
    if ([_delgate respondsToSelector:@selector(tabBar:didClickButtonOfIndex:)]) {
        [_delgate tabBar:self didClickButtonOfIndex:button.tag];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // 设置子控件的frame
    // 按钮的宽度和高度
    NSInteger buttonCount = self.items.count;
    
    CGFloat btnW = self.width / buttonCount;
    CGFloat btnH = self.height;
    CGFloat btnY = 0;
    CGFloat btnX = 0;
    for (NSInteger i = 0;i < buttonCount;i++) {
        // 获取子控件
        WASTabBarButton *btn = self.subviews[i];
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

@end
