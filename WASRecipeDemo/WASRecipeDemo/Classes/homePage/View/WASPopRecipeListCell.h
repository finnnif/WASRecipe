//
//  WASPopListCell.h
//  WASRecipeDemo
//
//  Created by sanking on 15/10/13.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WASPopRecipeList;

@interface WASPopRecipeListCell : UITableViewCell

/** 模型数据 */
@property (nonatomic, strong) WASPopRecipeList *recipeList;

@end
