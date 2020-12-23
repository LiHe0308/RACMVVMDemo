//
// LoginEventHandler.m
// RACMVVM
//
// Author:  下班不写程序
// Github:  https://github.com/LiHe0308
// E-mail:  969629918@qq.com
// 简   书:  https://www.jianshu.com/u/cde18f686c44
//
// Created by 下班不写程序 on 2020/12/21
//  _      _   _    _
// | |    |_| | |  | |
// | |     _  | |__| |  __
// | |    | | |  __  |//  \\
// | |__/\| | | |  | |||__//
// |_|__,/|_| |_|  |_|\\__,/
//
    

#import "LoginEventHandler.h"
#import "LoginViewModel.h"

@interface LoginEventHandler ()

@property (nonatomic, weak) UIViewController *userInterface;

@property (nonatomic, strong) LoginViewModel *viewModel; // 事件操作可根据viewModel 中的model 数据来判断

@end

@implementation LoginEventHandler

- (instancetype)initWithUserInterface:(UIViewController *)userInterface viewModel:(LoginViewModel *)viewModel {
    self = [super init];
    if (self) {
        _userInterface = userInterface;
        _viewModel = viewModel;
    }
    return self;
}

#pragma mark - cell 或者其他自定义事件都可以放进来, cell或者indexPath 就作为参数传递过来
- (void)onTapItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)onTapForDismiss {
    [self.userInterface dismissViewControllerAnimated:YES completion:nil];
}

@end
