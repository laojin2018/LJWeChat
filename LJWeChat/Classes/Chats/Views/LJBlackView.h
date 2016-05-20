//
//  LJBlackView.h
//  LJWeChat
//
//  Created by lemon on 16/5/20.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJBlackView;
@protocol LJBlackViewDelegate <NSObject>

@optional
- (void)blackViewShowAlert:(LJBlackView *)blackView andShowC:(UIAlertController *)alert;

@end
@interface LJBlackView : UIView

@property (weak, nonatomic) id<LJBlackViewDelegate> delegate;

@end
