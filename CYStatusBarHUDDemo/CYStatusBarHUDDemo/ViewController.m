//
//  ViewController.m
//  CYStatusBarHUDDemo
//
//  Created by Cyrill on 2016/12/2.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

#import "ViewController.h"
#import "CYStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)s:(id)sender {
    [CYStatusBarHUD cy_showMessage:@"没有什么事!!!!" image:[UIImage imageNamed:@"check"]];
}

- (IBAction)f:(id)sender {
    [CYStatusBarHUD cy_showError:@"加载失败！！！"];
}

- (IBAction)l:(id)sender {
    [CYStatusBarHUD cy_showLoading:@"正在加载中..."];
}

- (IBAction)h:(id)sender {
    [CYStatusBarHUD cy_hide];
}

@end
