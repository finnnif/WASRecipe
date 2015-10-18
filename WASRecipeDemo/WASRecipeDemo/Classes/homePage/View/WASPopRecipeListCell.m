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
#import <UIImageView+WebCache.h>

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
    [self.iconView sd_setImageWithURL:[NSURL URLWithString: popRecipeListItem.recipePic] placeholderImage:[UIImage imageNamed:@"123"]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.width = 60;
    self.imageView.height = 75;
    self.imageView.centerY = self.height * 0.5;
    
}

@end
