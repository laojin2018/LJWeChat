//
//  LJBlackView.m
//  LJWeChat
//
//  Created by lemon on 16/5/20.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJBlackView.h"

@implementation LJBlackView
- (IBAction)btnClick:(id)sender {
    // 弹出提示框
    UIAlertController *tipAlertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"just for fun" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        return ;
    }];
    
    [tipAlertC addAction:ok];
    
    // 使用代理显示提示框
    if ([self.delegate respondsToSelector:@selector(blackViewShowAlert:andShowC:)]) {
        [self.delegate blackViewShowAlert:self andShowC:tipAlertC];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
