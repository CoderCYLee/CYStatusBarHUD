//
//  CYStatusBarHUD.m
//  CYStatusBarHUD
//
//  Created by Cyrill on 2016/12/2.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

#import "CYStatusBarHUD.h"

#define CYMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const CYMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const CYAnimationDuration = 0.25;

@implementation CYStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

+ (void)showWindow {
    
    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    
    // frame数据
    CGFloat windowH = statusH;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor redColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:CYAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/** 显示成功信息 */
+ (void)cy_showSuccess:(NSString *)msg {
    [self cy_showMessage:msg image:[UIImage imageNamed:@"CYStatusBarHUD.bundle/success"]];
}

/** 显示正在处理信息 */
+ (void)cy_showLoading:(NSString *)msg {
    
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = CYMessageFont;
    label.frame = CGRectMake(0, window_.bounds.size.height-20, window_.bounds.size.width, 20);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes: @{NSFontAttributeName : CYMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height - 20 * 0.5 ;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];

}

/** 显示失败信息 */
+ (void)cy_showError:(NSString *)msg {
    [self cy_showMessage:msg image:[UIImage imageNamed:@"CYStatusBarHUD.bundle/error"]];
}

/** 显示文字 */
+ (void)cy_showMessage:(NSString *)msg {
    [self cy_showMessage:msg image:nil];
}

/** 隐藏 */
+ (void)cy_hide {
    [UIView animateWithDuration:CYAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

+ (void)cy_showMessage:(NSString *)msg image:(UIImage *)image {
    
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = CYMessageFont;
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = CGRectMake(0, window_.bounds.size.height-20, window_.bounds.size.width, 20);
    [window_ addSubview:button];
    

//    NSObject *obj;
//    // 取消之前的调用
//    [NSString cancelPreviousPerformRequestsWithTarget:obj selector:@selector(cy_hide) object:nil];
//    [obj performSelector:@selector(cy_hide) withObject:nil afterDelay:2.0];

    timer_ = [NSTimer scheduledTimerWithTimeInterval:CYMessageDuration target:self selector:@selector(cy_hide) userInfo:nil repeats:NO];

}

@end
