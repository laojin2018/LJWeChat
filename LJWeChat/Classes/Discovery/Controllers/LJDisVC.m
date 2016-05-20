//
//  LJDisVC.m
//  LJWeChat
//
//  Created by lemon on 16/5/19.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJDisVC.h"
#import "LJMyModel.h"
#import "LJMomentsVC.h"

@interface LJDisVC ()
@property (strong, nonatomic) NSArray  *modelGroup;

@end

@implementation LJDisVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 60;
}

#pragma mark - Table view data source
-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.modelGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 组模型
    NSArray *group = self.modelGroup[section];
    return group.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取数据
    NSArray *group = self.modelGroup[indexPath.section];
    LJMyModel *model = group[indexPath.row];
    // 创建cell
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置数据
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.textLabel.text = model.name;
    // 返回cell
    return cell;
}
// MARK:- 选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        // 创建控制器
        LJMomentsVC *momentVC = [[LJMomentsVC alloc] init];
        // 隐藏底部tabbar
//        momentVC.hidesBottomBarWhenPushed = YES;
        // 跳转控制器
        [self.navigationController pushViewController:momentVC animated:YES];
    }
}
// 懒加载
- (NSArray *)modelGroup{
    if (_modelGroup == nil) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Discover.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSArray *arr in array) {
            NSMutableArray *arrY = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSDictionary *dict in arr) {
                LJMyModel *model = [LJMyModel modelWithDict:dict];
                [arrY addObject:model];
            }
            [arrM addObject:arrY];
        }
        _modelGroup = arrM;
    }
    return _modelGroup.copy;
}

@end
