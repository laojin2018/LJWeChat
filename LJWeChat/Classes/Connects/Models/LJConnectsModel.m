//
//  LJConnectsModel.m
//  LJWeChat
//
//  Created by lemon on 16/5/20.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJConnectsModel.h"

@implementation LJConnectsModel
//实现自定义方法
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
