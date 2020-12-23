//
// YTKNetHttpDelegate.h
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

@class BaseRequest;

NS_ASSUME_NONNULL_BEGIN

@protocol YTKNetHttpDelegate <NSObject>

@required
- (void)onRequestFinish:(BaseRequest*)request data:(NSDictionary *)data;
- (void)onRequestFail:(BaseRequest*)request data:(NSDictionary * __nullable)data errMsg:(NSString *)errMsg errCode:(NSInteger)errCode;

@end

NS_ASSUME_NONNULL_END
