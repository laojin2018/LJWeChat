//
//  LJFrameModel.m
//  weChat
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "LJFrameModel.h"
#import "LJFriendsModel.h"

@implementation LJFrameModel

-(void)setFriendsModel:(LJFriendsModel *)friendsModel{
    _friendsModel = friendsModel;
    // 间隙
    CGFloat margin = 10;
    // 头像imageView
    _iconF = CGRectMake(margin, margin, 35, 35);
    
    // 昵称
    CGFloat nameX = CGRectGetMaxX(_iconF) + margin;
    _nameF = CGRectMake(nameX, margin, 200, 35);
    
    // 正文
    CGFloat mainW = [UIScreen mainScreen].bounds.size.width;
    CGFloat maxWidth = mainW - 2*margin;
    CGFloat conY = CGRectGetMaxY(_iconF) + margin;
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    NSDictionary *attributes = @{NSFontAttributeName:LJTEXTFONT};
    CGSize textSize = [_friendsModel.content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    _contentF = CGRectMake(margin, conY, textSize.width, textSize.height);
    
    // 图片
    CGFloat cellHeight = CGRectGetMaxY(_contentF);
    if (_friendsModel.picture) {
        UIImage *image = [UIImage imageNamed:_friendsModel.picture];
        _pictureF = CGRectMake(margin, CGRectGetMaxY(_contentF)+margin, image.size.width, image.size.height);
        cellHeight = CGRectGetMaxY(_pictureF);
    }
    
    // 计算行高
    _cellHeight = cellHeight + margin;
}

@end
