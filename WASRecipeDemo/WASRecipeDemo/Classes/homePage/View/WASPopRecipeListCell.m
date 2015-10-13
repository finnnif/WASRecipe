//
//  WASPopListCell.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/13.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASPopRecipeListCell.h"
#import "WASPopRecipeList.h"
#import "WASUer.h"

@interface WASPopRecipeListCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *uerNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;


@end

@implementation WASPopRecipeListCell

- (void)setPopRecipeListItem:(WASPopRecipeList *)popRecipeListItem
{
    _popRecipeListItem = popRecipeListItem;
    
    self.nameLabel.text = popRecipeListItem.name;
    self.uerNameLabel.text = popRecipeListItem.author.name;
    [self.iconView setupRectHeaderFromURL:popRecipeListItem.recipePic];
}

@end
