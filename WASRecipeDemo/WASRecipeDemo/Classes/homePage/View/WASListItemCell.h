//
//  WASListItemCell.h
//  WASRecipeDemo
//
//  Created by sanking on 15/10/12.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WASPopList;

@interface WASListItemCell : UITableViewCell

/** 数据模型 */
@property (nonatomic, strong) WASPopList *listItem;

@end
