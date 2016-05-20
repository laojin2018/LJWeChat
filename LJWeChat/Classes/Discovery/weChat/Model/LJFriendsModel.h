//
//  LJFriendsModel.h
//  weChat
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LJTEXTFONT [UIFont systemFontOfSize:15]


@interface LJFriendsModel : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *headImg;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *nickname;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsModelWithDIct:(NSDictionary *)dict;

@end
