//
// LoginRequest.m
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
    

#import "LoginRequest.h"

@implementation LoginRequest {
    NSString *_phoneNumber;
}

- (instancetype)initWithMobile:(NSString *)mobile {
    self = [super init];
    if (self) {
        _phoneNumber = mobile;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/mobi/sendTxtMsgCode";
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    NSMutableDictionary *requestParam = [NSMutableDictionary dictionary];
    [self addValueForKey:requestParam key:@"phoneNumber" value:_phoneNumber];
    return  requestParam;
}

@end
