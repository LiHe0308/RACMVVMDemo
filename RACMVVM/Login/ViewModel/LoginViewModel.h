//
// LoginViewModel.h
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
    

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

/// 用来发送登录的网络请求
@property (nonatomic, strong) RACCommand *logInCommand;

/// 用来接收登录网络请求的结果
@property (nonatomic, strong) RACSubject *logInSubject;

@end

NS_ASSUME_NONNULL_END
