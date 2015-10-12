//
//  WASListItemCell.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/12.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASListItemCell.h"
#import "WASPopList.h"
#import <UIImageView+WebCache.h>

@interface WASListItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@end

@implementation WASListItemCell

- (void)setListItem:(WASPopList *)listItem
{
    _listItem = listItem;
    
    self.imageView.clipsToBounds = YES;
    // 设置标题
    self.nameLabel.text = listItem.display_name;
    self.descLabel.text = listItem.desc;
    // 设置图片
#warning 设置成只是内存缓存
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:listItem.pic] placeholderImage:[UIImage imageNamed:@"pudding"]];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.imageView.width = 65;
    self.imageView.height = 65;
    self.imageView.centerY = self.height * 0.5;
}

@end
