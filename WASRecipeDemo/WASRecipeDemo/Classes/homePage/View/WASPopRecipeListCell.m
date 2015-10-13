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

- (void)setRecipeList:(WASPopRecipeList *)recipeList
{
    _recipeList = recipeList;
    
    self.nameLabel.text = recipeList.name;
    self.uerNameLabel.text = recipeList.author.name;
    [self.iconView setupRectHeaderFromURL:recipeList.recipePic];
}

@end
