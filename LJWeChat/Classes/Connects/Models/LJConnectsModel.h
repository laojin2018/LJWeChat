//
//  LJConnectsModel.h
//  LJWeChat
//
//  Created by lemon on 16/5/20.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJConnectsModel : NSObject

//根据数据模型，定义可供外部访问的模型属性
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *icon;


//声明自定义构造方法
- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) modelWithDict:(NSDictionary *)dict;
@end
