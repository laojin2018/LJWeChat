//
//  LJFriendsModel.m
//  weChat
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "LJFriendsModel.h"

@implementation LJFriendsModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)friendsModelWithDIct:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
