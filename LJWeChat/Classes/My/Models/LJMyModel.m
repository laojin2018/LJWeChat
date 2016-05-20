//
//  LJStatus.m
//  老金微博
//
//  Created by lemon on 16/4/12.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJMyModel.h"

@implementation LJMyModel
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
