//
//  WASRecipeList.h
//  WASRecipeDemo
//
//  Created by sanking on 15/10/12.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WASUer;

@interface WASPopRecipeList : NSObject

/** 菜谱名称 */
@property (nonatomic, copy) NSString *name;

/** 用户 */
@property (nonatomic, strong) WASUer *author;

/** 封面图片url */
@property (nonatomic, strong) NSString *recipePic;

@end
