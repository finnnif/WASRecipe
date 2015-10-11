//
//  WASLoginController.m
//  
//
//  Created by sanking on 15/10/10.
//
//

#import "WASLoginController.h"

@interface WASLoginController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *gap;

@end

@implementation WASLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupNav];
    [self setupGapLength];
}

// 根据设备调整约束
- (void)setupGapLength
{
    if (iPhone4Or4s) {
        self.gap.constant = 40;
    }
    else if (iPhone5Or5s) {
        self.gap.constant = 120;
    }
    else if (iPhone6) {
        self.gap.constant = 190;
    }
    else if (iPhone6Plus) {
        self.gap.constant = 260;
    }
}

// 设置导航条
- (void)setupNav
{
    self.title = @"登录";
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    
    leftButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [leftButton setTitleColor:WASCommonRedColor forState:UIControlStateNormal];
    [leftButton setTitleColor:WASCommonTranslucentRedColor forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [leftButton sizeToFit];
    leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
