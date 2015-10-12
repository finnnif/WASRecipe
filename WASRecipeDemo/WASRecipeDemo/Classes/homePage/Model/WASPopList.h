//
//  WASListItem.h
//  WASRecipeDemo
//
//  Created by sanking on 15/10/12.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WASPopList : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *display_name;
/** 描述 */
@property (nonatomic, copy) NSString *desc;
/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 图片url */
@property (nonatomic, copy) NSString *pic;

@end
