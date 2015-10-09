//
//  WASTabBar.h
//  WASRecipeDemo
//
//  Created by sanking on 15/10/1.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WASTabBar;

@protocol WASTabBarDelgate <NSObject>

@optional
- (void)tabBar:(WASTabBar *)tabBar didClickButtonOfIndex:(NSInteger)index;

@end

@interface WASTabBar : UIView

/** UITabBarItem模型数组 */
@property (nonatomic, strong) NSArray *items;

/** delgate */
@property (nonatomic, weak) id<WASTabBarDelgate> delgate;

@end
