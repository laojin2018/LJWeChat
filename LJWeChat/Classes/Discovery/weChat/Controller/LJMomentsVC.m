//
//  ViewController.m
//  weChat
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "LJMomentsVC.h"
#import "LJFriendsModel.h"
#import "LJFriendsCell.h"
#import "LJFrameModel.h"


#define LJScreenW [UIScreen mainScreen].bounds.size.width
#define LJScreenH [UIScreen mainScreen].bounds.size.height
#define LJHeaderImageH  200

@interface LJMomentsVC ()


// 此属性是在向数组添加数据的情况下使用的
@property (nonatomic, strong) NSMutableArray *friends;
//
@property (nonatomic, strong) UIImageView *headerImgView;
// 蒙版
@property (nonatomic, strong) UIButton *cover;
// 放大后的图片
@property (nonatomic, strong) UIImageView *bigImgView;

// 放大图片的imgName
@property (nonatomic, copy) NSString *bigImgName;



@end

@implementation LJMomentsVC

// 懒加载
-(NSMutableArray *)friends{
    if (_friends == nil) {
        _friends = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in array) {
            LJFrameModel *frameModel = [[LJFrameModel alloc] init];
            LJFriendsModel *friendsModel = [LJFriendsModel friendsModelWithDIct:dict];
            frameModel.friendsModel = friendsModel;
            [_friends addObject:frameModel];
        }
    }
    return _friends;
}

- (void)viewDidLoad {
    [super viewDidLoad]; 
    // 设置 backGroundView
    [self setBackGroundView];
    
    // 设置 headerView
    [self setHeaderView];

    // 接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noty:) name:@"tapClick" object:nil];
}

#pragma mark - 设置HeaderView
- (void)setHeaderView{
    
    CGFloat margin = 10;
    
    //tableView的头部视图
    CGFloat iconWH = 80;
    
    CGFloat headerH = LJHeaderImageH + iconWH - margin;
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, LJScreenW, headerH);
    //    headerView.backgroundColor = [UIColor orangeColor];
    //[headerView addSubview:headerImage]; // 添加到headerView上headerImage会随着headerView的变化而变化,并不能讲headerImage的y设置0的位置,,,backGroundView的y不会随着你的拖拽也发生变化,可以设置headerImage的y为0,所以要添加在backGroundView上
    headerView.clipsToBounds = YES;
    
    // header头像按钮
    UIButton *iconBtn = [[UIButton alloc] init];
    NSString *bigImgName = @"kenan";
    self.bigImgName = bigImgName;
    [iconBtn setImage:[UIImage imageNamed:bigImgName] forState:UIControlStateNormal];
    CGFloat iconX = LJScreenW - iconWH - margin;
    CGFloat iconY = headerH - iconWH;
    iconBtn.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
    [iconBtn addTarget:self action:@selector(iconBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:iconBtn];
    
    // 添加昵称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"iOS大神圈";
    nameLabel.textColor = [UIColor redColor];
    nameLabel.font = [UIFont systemFontOfSize:17];
    // 计算nameSize
    CGSize maxSize = CGSizeMake(200, MAXFLOAT);
    NSDictionary *attribute = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
    CGSize nameSize = [nameLabel.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    // 计算 nameX
    CGFloat nameX = iconX - nameSize.width - margin;
    // 计算 nameY
    CGFloat nameY = iconY + nameSize.height;
    // 设置nameLabel的frame
    nameLabel.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);

    [headerView addSubview:nameLabel];
    
    // 设置headerView
    self.tableView.tableHeaderView = headerView;
    
//    nameLabel.backgroundColor = [UIColor orangeColor];
//    headerView.backgroundColor = [UIColor brownColor];

}

#pragma mark - 设置背景
- (void)setBackGroundView{
    //图片视图
    UIImageView *headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, LJHeaderImageH)];
    headerImgView.contentMode = UIViewContentModeScaleAspectFill;
    headerImgView.image = [UIImage imageNamed:@"headerImage1.jpg"];
    self.headerImgView = headerImgView;
    
    //tableView背景View
    UIView *backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, LJScreenH)];
    
    // 将headerImage添加到backgroundView上
    [backGroundView addSubview:headerImgView];
    
    // 设置backgroundView
    self.tableView.backgroundView = backGroundView;
}
// 头像点击
- (void)iconBtnClick:(UIButton *)button{
    [self addBigImageViewCover];
}
// 通知
- (void)noty:(NSNotification *)noti{
    NSLog(@"noti %@", noti.userInfo[@"imageName"]);
    self.bigImgName = noti.userInfo[@"imageName"];
    // 设置蒙版
    [self addBigImageViewCover];
}
// 设置蒙版
- (void)addBigImageViewCover{
    
    // 设置放大的图片
    UIImageView *bigImgVew = [[UIImageView alloc] init];
    UIImage *image = [UIImage imageNamed:self.bigImgName];
    bigImgVew.image = image;
    bigImgVew.frame = CGRectMake(0, 0, 0, 0);
    [self.tableView.window addSubview:bigImgVew];
    self.bigImgView = bigImgVew;
    
    // 蒙版
    UIButton *cover = [[UIButton alloc] init];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0;
    cover.frame = self.tableView.bounds;
    [cover addTarget:self action:@selector(bigImage) forControlEvents:UIControlEventTouchDown];
    
    [self.tableView addSubview:cover];
    self.cover = cover;
    
    // 放大
    [self bigImage];
}

/** 放大 */
- (void)bigImage
{
    // 1. 增加蒙版(跟根视图一样大小)
    if (self.cover.alpha == 0.0) {
        // 2. 将图片移动到视图的顶层
        [self.view bringSubviewToFront:self.bigImgView];
        
        // 3. 动画放大图片
        // 1> 计算目标位置
        CGFloat viewW = self.view.bounds.size.width;
        CGFloat imageW = viewW;
        CGFloat imageH = imageW;
        CGFloat imageY = (self.view.bounds.size.height - imageH) * 0.5;
        
        [UIView animateWithDuration:1.0f animations:^{
            self.cover.alpha = 0.5;
            self.bigImgView.frame = CGRectMake(0, imageY, imageW, imageH);
        }];
    } else {

        // 图片已经是放大显示的了
        [UIView animateWithDuration:1.0 animations:^{
            // 1. imageVew动画变小
            self.bigImgView.frame = CGRectMake(0, 0, 0, 0);
            // 2. 遮罩透明，看不见了
            self.cover.alpha = 0.0f;
            
        } completion:^(BOOL finished) {
            [self.bigImgView removeFromSuperview];
            [self.cover removeFromSuperview];
        }];
    }
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.bigImgView removeFromSuperview];
    [self.cover removeFromSuperview];

    NSLog(@"table %f",scrollView.contentOffset.y);
    CGRect tempRect = self.headerImgView.frame;
    // 大于0,是向上滚动,headerImage的y要缩小
    if (scrollView.contentOffset.y > 0) {
        tempRect.origin.y = -scrollView.contentOffset.y;
        self.headerImgView.frame = tempRect;
       
    // 小于0,是向下滚动,headerImage的y=0,headerImage的height的值要放大
    }else{
        tempRect.size.height = LJHeaderImageH - scrollView.contentOffset.y;
        tempRect.origin.y = 0;
        self.headerImgView.frame = tempRect;
    }
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.friends.count;
}
#pragma mark - 第二种方法：设置双模型的情况
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 创建cell
    static NSString *identifier = @"mycell";
    LJFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[LJFriendsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    // 取出frame模型
    LJFrameModel *frameModel = self.friends[indexPath.row];
    cell.frameModel = frameModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LJFrameModel *frame = self.friends[indexPath.row];
    return frame.cellHeight;
}


// 点击cell,增加数据
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取出对应的模型
    LJFrameModel *frame = self.friends[indexPath.row];
    // 插入取出的模型
    [self.friends insertObject:frame atIndex:indexPath.row];
    // 刷新
    [self.tableView reloadData];
    // 滚到指定的行
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

@end
