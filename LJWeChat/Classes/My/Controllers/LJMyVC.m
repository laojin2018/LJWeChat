//
//  LJMyVC.m
//  LJWeChat
//
//  Created by lemon on 16/5/19.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJMyVC.h"
#import "LJMyModel.h"
#import "LJSettingVC.h"

@interface LJMyVC ()
@property (strong, nonatomic) NSArray  *modelGroup;

@end

@implementation LJMyVC

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.tabBarItem.title = @"我";
        UIImage *myima = [UIImage imageNamed:@"tabbar_me"];
        myima = [myima imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = myima;
        UIImage *selMyIma = [UIImage imageNamed:@"tabbar_meHL"];
        selMyIma = [selMyIma imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selMyIma;
        
        self.navigationItem.title = @"我的";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.modelGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 取出组
    NSArray *group = self.modelGroup[section];
    return group.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取数据
    NSArray *group = self.modelGroup[indexPath.section];
    NSDictionary *dictCell = group[indexPath.row];
    // 创建cell
    static NSString *ID = @"c";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置数据
    cell.textLabel.text = dictCell[@"name"];
    cell.imageView.image = [UIImage imageNamed:dictCell[@"icon"]];
    // 返回
    return cell;
}

// 选中了某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == self.modelGroup.count - 1) {
        // 创建设置控制器
        LJSettingVC *settingVC = [[LJSettingVC alloc] init];
        // 跳转
        [self.navigationController pushViewController:settingVC animated:YES];
    }
}
// 懒加载
- (NSArray *)modelGroup{
    if (_modelGroup == nil) {
        _modelGroup = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Mine.plist" ofType:nil]];
    }
    return _modelGroup;
}

@end










