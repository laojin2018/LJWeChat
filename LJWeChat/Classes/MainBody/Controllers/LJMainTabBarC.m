//
//  LJMainTabBarC.m
//  LJWeChat
//
//  Created by lemon on 16/5/20.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJMainTabBarC.h"
#import "LJChatsVC.h"
#import "LJConVC.h"
#import "LJDisVC.h"
#import "LJMyVC.h"
#import "LJBasicNavVC.h"
@interface LJMainTabBarC ()

@end

@implementation LJMainTabBarC

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"ss");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建子控制器（导航控制器），因为设置控制器的导航栏和标签栏都必须通过要显示的控制来设置，所以可以在要显示的控制器中抽取一个方法，来封装设置每个显示控制器的导航栏和标签栏的方法
    // 聊天
    LJChatsVC *chatVC = [[LJChatsVC alloc]init];
    LJBasicNavVC *chatNav = [self getNaVcWithChildVC:chatVC andImageName:@"tabbar_contacts" andSelectImageName:@"tabbar_contactsHL" andTitle:@"联系人"];
    // 联系人
    LJConVC *connectVC = [[LJConVC alloc] init];
    LJBasicNavVC *connectNav = [self getNaVcWithChildVC:connectVC andImageName:@"tabbar_contacts" andSelectImageName:@"tabbar_contactsHL" andTitle:@"联系人"];
    // 发现
    LJDisVC *disVC = [[LJDisVC alloc] init];
    LJBasicNavVC *disNav = [self getNaVcWithChildVC:disVC andImageName:@"tabbar_discover" andSelectImageName:@"tabbar_discoverHL" andTitle:@"发现"];
    // 我的
    LJMyVC *myVC = [[LJMyVC alloc] init];
    LJBasicNavVC *myNav = [self getNaVcWithChildVC:myVC andImageName:@"tabbar_me" andSelectImageName:@"tabbar_meHL" andTitle:@"我"];
    
    // 设置标签栏文字颜色
    self.tabBar.tintColor = [UIColor greenColor];
    // 添加子控制器
    self.viewControllers = @[chatNav,connectNav,disNav,myNav];
    
}
// 设置每个子控制器的标签栏和导航栏的方法
- (LJBasicNavVC *)getNaVcWithChildVC:(UIViewController *)ChildVC andImageName:(NSString *)imageName andSelectImageName:(NSString *)selectImageName andTitle:(NSString *)title{
    
//    ChildVC.tabBarItem.title = title;
//    ChildVC.navigationItem.title = title;
    // 直接设置空间的title属性，那么控件的导航栏标题栏和标签栏的标题都默认是他
    ChildVC.title = title;
    
    UIImage *conima = [UIImage imageNamed:imageName];
    conima = [conima imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ChildVC.tabBarItem.image = conima;
    UIImage *selConIma = [UIImage imageNamed:selectImageName];
    selConIma = [selConIma imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ChildVC.tabBarItem.selectedImage = selConIma;
    
    return [[LJBasicNavVC alloc] initWithRootViewController:ChildVC];
}

@end


