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
    // 设置标题文字
    UILabel *label = [[UILabel alloc] init];
    label.text = @"登录";
    label.font = [UIFont systemFontOfSize:18];
    [label sizeToFit];
    label.textColor = WASTextGrayColor;
    self.navigationItem.titleView = label;

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"取消" itemEdgeInsets:UIEdgeInsetsMake(0, -7, 0, 0) target:self action:@selector(cancel)];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
