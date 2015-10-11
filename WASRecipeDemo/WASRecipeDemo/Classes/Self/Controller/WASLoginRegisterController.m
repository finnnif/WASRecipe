//
//  WASLoginRegisterController.m
//  WASRecipeDemo
//
//  Created by sanking on 15/10/10.
//  Copyright (c) 2015年 sanking. All rights reserved.
//

#import "WASLoginRegisterController.h"
#import "WASLoginController.h"
#import "WASRegisterController.h"


@interface WASLoginRegisterController ()

@end

@implementation WASLoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login
{
    WASNavigationController *nv = [[WASNavigationController alloc] initWithRootViewController:[[WASLoginController alloc] init]];
    
    [self presentViewController:nv animated:YES completion:^{
        
    } ];
}

- (IBAction)phoneRegister
{
    WASNavigationController *nv = [[WASNavigationController alloc] initWithRootViewController:[[WASRegisterController alloc] init]];
    
    [self presentViewController:nv animated:YES completion:^{
        
    } ];
}


- (IBAction)cancel
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
