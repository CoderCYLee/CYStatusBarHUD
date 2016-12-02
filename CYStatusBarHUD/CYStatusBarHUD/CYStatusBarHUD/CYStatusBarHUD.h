//
//  CYStatusBarHUD.h
//  CYStatusBarHUD
//
//  Created by Cyrill on 2016/12/2.
//  Copyright © 2016年 Cyrill. All rights reserved.
//  大版本.功能更新的版本号.bug修复版本号
//  1.0.1

#import <UIKit/UIKit.h>

@interface CYStatusBarHUD : NSObject

/** 显示成功信息 */
+ (void)cy_showSuccess:(NSString *)msg;
/** 显示正在处理信息 */
+ (void)cy_showLoading:(NSString *)msg;
/** 显示失败信息 */
+ (void)cy_showError:(NSString *)msg;
/** 显示文字 */
+ (void)cy_showMessage:(NSString *)msg;

/**
 显示普通信息

 @param msg 文字
 @param image 图片
 */
+ (void)cy_showMessage:(NSString *)msg image:(UIImage *)image;
/** 隐藏 */
+ (void)cy_hide;

@end
