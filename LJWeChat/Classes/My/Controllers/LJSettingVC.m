//
//  LJSettingVC.m
//  LJWeChat
//
//  Created by lemon on 16/5/20.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJSettingVC.h"
#import "LJAboutVC.h"

@interface LJSettingVC ()
@property (strong, nonatomic) NSArray  *modelGroup;

@end

@implementation LJSettingVC
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
//    cell.imageView.image = [UIImage imageNamed:dictCell[@"icon"]];
    // 返回
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        // 创建关于控制器
        LJAboutVC *aboutVC = [[LJAboutVC alloc] init];
        // 跳转
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
}


// 懒加载
- (NSArray *)modelGroup{
    if (_modelGroup == nil) {
        _modelGroup = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Setting.plist" ofType:nil]];
    }
    return _modelGroup;
}

@end
