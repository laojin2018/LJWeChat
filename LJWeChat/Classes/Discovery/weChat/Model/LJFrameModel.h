//
//  LJFrameModel.h
//  weChat
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LJFriendsModel;

@interface LJFrameModel : NSObject

@property (nonatomic, strong) LJFriendsModel *friendsModel;

@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGRect nameF;
@property (nonatomic, assign) CGRect contentF;
@property (nonatomic, assign) CGRect pictureF;
@property (nonatomic, assign) CGFloat cellHeight;

@end
