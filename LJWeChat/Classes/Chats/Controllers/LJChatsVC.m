//
//  LJHallVC.m
//  彩票demo
//
//  Created by lemon on 16/5/16.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJChatsVC.h"
#import "LJBlackView.h"
@interface LJChatsVC ()<LJBlackViewDelegate>
{
    UIView *_blackView;
    UIView *_mengView;
    UITapGestureRecognizer *_tapGesture;
}

@end

@implementation LJChatsVC
// 设置tableView的样式
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建添加按钮
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    self.navigationItem.rightBarButtonItem = add;
   
}
- (void)addAction:(UIBarButtonItem *)sender{
    // 床架蒙版
    UIView *mengView = [[UIView alloc] initWithFrame:self.tabBarController.view.bounds];
    mengView.backgroundColor = [UIColor blackColor];
    mengView.alpha = 1;
    [self.tabBarController.view addSubview:mengView];
    _mengView = mengView;
    
    // 通过xib加载黑色view
    LJBlackView *blackView = [[NSBundle mainBundle] loadNibNamed:@"BlackView" owner:nil options:nil].lastObject;
    blackView.frame = CGRectMake(175, 0, 200, 106);

    [self.tabBarController.view addSubview:blackView];
    _blackView = blackView;
    
    // 添加手势
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action:)];
    [mengView addGestureRecognizer:tapGes];
    _tapGesture = tapGes;
    // 设置代理
    blackView.delegate =  self;
}
// 点击手势的方法
- (void)action:(UITapGestureRecognizer *)gesture{

    [_blackView removeFromSuperview];
    [_mengView removeFromSuperview];
    // 移除手势
    [self.view removeGestureRecognizer:_tapGesture];
}

// 实现协议方法
- (void)blackViewShowAlert:(LJBlackView *)blackView andShowC:(UIAlertController *)alert{
    [self presentViewController:alert animated:YES completion:nil];
}
@end








