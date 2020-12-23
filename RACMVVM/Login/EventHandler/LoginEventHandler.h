//
// LoginEventHandler.h
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
    

#import <UIKit/UIkit.h>

@class LoginViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface LoginEventHandler : NSObject

- (instancetype)initWithUserInterface:(UIViewController *)userInterface
                            viewModel:(LoginViewModel *)viewModel;

- (void)onTapForDismiss;

@end

NS_ASSUME_NONNULL_END
