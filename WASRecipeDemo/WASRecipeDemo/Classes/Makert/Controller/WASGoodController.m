//
//  WASGoodController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/20.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASGoodController.h"

@interface WASGoodController ()

@end

@implementation WASGoodController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WASCommonBgColor;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UILabel *label = [[UILabel alloc] init];
    label.width = self.view.width;
    label.height = 100;
    label.center = self.view.center;
    label.text = @"居然加密,数据都不给我!!!";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
