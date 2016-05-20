//
//  LJAboutVC.m
//  LJWeChat
//
//  Created by lemon on 16/5/20.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJAboutVC.h"
# import "LJAboutModel.h"
@interface LJAboutVC ()
@property (strong, nonatomic) NSArray  *modelGroup;

@end

@implementation LJAboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置尾部视图
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    // 设置头部视图
    UIView *headerView = [[NSBundle mainBundle] loadNibNamed:@"LJAboutHeader" owner:nil options:nil].lastObject;
    self.tableView.tableHeaderView = headerView;


}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelGroup.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取数据
    LJAboutModel *model = self.modelGroup[indexPath.row];
    // 创建cell
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置数据
    cell.textLabel.text = model.name;
    // 返回cell
    return cell;
}
// 懒加载
- (NSArray *)modelGroup{
    if (_modelGroup == nil) {
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"About.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        for (NSDictionary *dict in dictArr) {
            LJAboutModel *model = [LJAboutModel modelWithDict:dict];
            [arrM addObject:model];
        }
        _modelGroup = arrM;
    }
    return _modelGroup.copy;
}

@end
