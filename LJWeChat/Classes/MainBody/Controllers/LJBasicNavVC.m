//
//  LJBasicNavVC.m
//  彩票demo
//
//  Created by lemon on 16/5/16.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJBasicNavVC.h"

@interface LJBasicNavVC ()

@end

@implementation LJBasicNavVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 统一设置导航栏的背景
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"topbarbg_ios7"] forBarMetrics:UIBarMetricsDefault];
    // 统一设置导航栏颜色
    self.navigationBar.titleTextAttributes = @{
        NSForegroundColorAttributeName:[UIColor whiteColor]
        
                                               };
    self.navigationBar.tintColor = [UIColor whiteColor];


}

// 拦截push方法进行操作
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    // 隐藏标签栏
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
//    viewController.hidesBottomBarWhenPushed = YES;
    // 统一设置所有导航控制器的返回按钮样式
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [super pushViewController:viewController animated:animated];
}

@end
