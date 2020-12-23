//
// LoginViewModel.m
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
    

#import "LoginViewModel.h"

#import "YTKNetHttpDelegate.h"

#import "LoginRequest.h"

@interface LoginViewModel () <YTKNetHttpDelegate>

@end

@implementation LoginViewModel


#pragma mark - private action
- (void)addRequest:(BaseRequest *)request {
    [request startWithDelegate:self];
}

#pragma mark - lazy load
- (RACCommand *)logInCommand {
    if (!_logInCommand) {
        @weakify(self)
        _logInCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self)
            LoginRequest *request = [[LoginRequest alloc] initWithMobile:input];
            [self addRequest:request];
            return [RACSignal empty];
        }];
    }
    return _logInCommand;
}

- (RACSubject *)logInSubject {
    if (!_logInSubject) {
        _logInSubject = [[RACSubject alloc] init];
    }
    return _logInSubject;
}

#pragma mark - protocol
- (void)onRequestFail:(nonnull BaseRequest *)request data:(NSDictionary * _Nullable)data errMsg:(nonnull NSString *)errMsg errCode:(NSInteger)errCode {
    if([request isKindOfClass:[LoginRequest class]]) {
        [self.logInSubject sendNext:@"验证码发送失败"];
    }
}

- (void)onRequestFinish:(nonnull BaseRequest *)request data:(nonnull NSDictionary *)data {
    if([request isKindOfClass:[LoginRequest class]]) {
        [self.logInSubject sendNext:@"验证码发送成功"];
    }
}

@end
