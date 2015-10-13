//
//  WASListItemCell.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/12.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASPopListCell.h"
#import "WASPopList.h"
#import <UIImageView+WebCache.h>

@interface WASPopListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@end

@implementation WASPopListCell

- (void)setListItem:(WASPopList *)listItem
{
    _listItem = listItem;
    
    self.imageView.clipsToBounds = YES;
    // 设置标题
    self.nameLabel.text = listItem.display_name;
    self.descLabel.text = listItem.desc;
    // 设置图片
    [self.imageView setupRectHeaderFromURL:listItem.pic];
    self.imageView.layer.cornerRadius = 5;
    
}

//- (void)setFrame:(CGRect)frame
//{
//    frame.size.height -= 1;
//    [super setFrame:frame];
//}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//
//    self.imageView.width = 65;
//    self.imageView.height = 65;
//    self.imageView.centerY = self.height * 0.5;
//}

@end
