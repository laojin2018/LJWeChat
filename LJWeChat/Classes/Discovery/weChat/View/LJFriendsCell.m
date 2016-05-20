//
//  LJFriendsCell.m
//  weChat
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "LJFriendsCell.h"
#import "LJFriendsModel.h"
#import "LJFrameModel.h"


@interface LJFriendsCell ()
/**
 * 头像
 */
@property (nonatomic, strong) UIImageView *iconImageView;
/**
 * 昵称
 */
@property (nonatomic, strong) UILabel *nameLabel;
/**
 * 正文
 */
@property (nonatomic, strong) UILabel *contentLabel;
/**
 * 图片
 */
@property (nonatomic, strong) UIImageView *pictureImageView;

@end

@implementation LJFriendsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加控件
        // 添加头像imageView
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.layer.cornerRadius = 17.5;
        iconImageView.clipsToBounds = YES;
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        // 添加昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 添加正文
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        contentLabel.font = LJTEXTFONT;
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;

        // 添加图片
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        pictureImageView.userInteractionEnabled = YES;
        
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
        [pictureImageView addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapClick{
    // 添加通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tapClick" object:self userInfo:@{@"imageName":_frameModel.friendsModel.picture}];
}

#pragma mark - 第二种方法：设置双模型的情况
- (void)setFrameModel:(LJFrameModel *)frameModel{
    _frameModel = frameModel;
    // 设置数据
    [self setCellData];
    // 设置frame
    [self setCellFrame];

}
- (void)setCellData{
    LJFriendsModel *friendsModel = _frameModel.friendsModel;
    // 头像imageView
    self.iconImageView.image = [UIImage imageNamed:friendsModel.headImg];
    // 昵称
    self.nameLabel.text = friendsModel.nickname;
    // 正文
    self.contentLabel.text = friendsModel.content;
    
    // 图片
    self.pictureImageView.image = [UIImage imageNamed:friendsModel.picture];
}


- (void)setCellFrame{
    // 头像imageView
    self.iconImageView.frame = _frameModel.iconF;
    // 昵称
    self.nameLabel.frame = _frameModel.nameF;
    // 正文
    self.contentLabel.frame = _frameModel.contentF;
    // 添加图片
    self.pictureImageView.frame = _frameModel.pictureF;
    CGPoint tempCenter = self.pictureImageView.center;
    tempCenter.x = self.center.x;
    self.pictureImageView.center = tempCenter;
}

@end
