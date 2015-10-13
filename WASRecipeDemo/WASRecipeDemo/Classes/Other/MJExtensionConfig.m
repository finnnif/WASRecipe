//
//  MJExtensionConfig.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/13.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "MJExtensionConfig.h"
#import <MJExtension.h>
#import "WASPopList.h"
#import "WASPopRecipeList.h"

@implementation MJExtensionConfig

+(void)load
{
    [WASPopList setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 
                 };
    }];
    [WASPopRecipeList setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"recipePic" : @"pics[0]"
                 };
    }];
    
    [WASPopList setupObjectClassInArray:^NSDictionary *{
        return @{
                 
                 
                 // @"pop_lists[lists]" : [WASPopList class]
                 };
    }];
    
    [WASPopRecipeList setupObjectClassInArray:^NSDictionary *{
        return @{
                 
                 // @"pop_lists[lists]" : [WASPopList class]
                 };
    }];
}

@end
