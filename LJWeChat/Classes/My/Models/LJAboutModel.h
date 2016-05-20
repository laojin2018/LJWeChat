//
//  LJStatus.h
//  老金微博
//
//  Created by lemon on 16/4/12.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJAboutModel : NSObject
//根据数据模型，定义可供外部访问的模型属性
@property (copy,nonatomic) NSString *name;


//声明自定义构造方法
- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) modelWithDict:(NSDictionary *)dict;
@end
