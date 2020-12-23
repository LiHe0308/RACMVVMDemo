//
// HomeViewController.m
// RACMVVM
//
// Author:  下班不写程序
// Github:  https://github.com/LiHe0308
// E-mail:  969629918@qq.com
// 简   书:  https://www.jianshu.com/u/cde18f686c44
//
// Created by 下班不写程序 on 2020/12/14
//  _      _   _    _
// | |    |_| | |  | |
// | |     _  | |__| |  __
// | |    | | |  __  |//  \\
// | |__/\| | | |  | |||__//
// |_|__,/|_| |_|  |_|\\__,/
//
    

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"首页";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    LoginViewController *loginVc = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

@end
