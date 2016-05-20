//
//  LJConVC.m
//  LJWeChat
//
//  Created by lemon on 16/5/19.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJConVC.h"
#import "LJConnectsModel.h"
@interface LJConVC ()
@property (strong, nonatomic) NSArray  *modelGroup;

@end

@implementation LJConVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 设置行高
    self.tableView.rowHeight = 60;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.modelGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *group = self.modelGroup[section];
    return group.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取数据
    NSArray *group = self.modelGroup[indexPath.section];
    LJConnectsModel *conModel = group[indexPath.row];
    // 创建cell
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置数据
    cell.textLabel.text = conModel.name;
    cell.imageView.image = [UIImage imageNamed:conModel.icon];
    // 返回cell
    return cell;
}


// 懒加载
- (NSArray *)modelGroup{
    if (_modelGroup == nil) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LinkMan.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSArray *arr in array) {
            NSMutableArray *arrY = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSDictionary *dict in arr) {
                LJConnectsModel *model = [LJConnectsModel modelWithDict:dict];
                [arrY addObject:model];
            }
            [arrM addObject:arrY];
        }
        _modelGroup = arrM;
    }
    return _modelGroup.copy;
}

@end
