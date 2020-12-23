//
// BaseRequest.h
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
    

#import <YTKNetwork/YTKNetwork.h>

@class BaseRequest;

@protocol YTKNetHttpDelegate;

NS_ASSUME_NONNULL_BEGIN

typedef void(^BaseRequestSuccessBlock)(BaseRequest *request, NSDictionary *data);

typedef void(^BaseRequestfailureBlock)(BaseRequest *request, NSDictionary * __nullable data, NSString *errMsg, NSInteger errCode);

@interface BaseRequest : YTKRequest

- (void)startWithSuccessBlock:(BaseRequestSuccessBlock)success
                 failureBlock:(BaseRequestfailureBlock)failure;

- (void)addValueForKey:(NSMutableDictionary *)dict
                   key:(NSString *)key
                 value:(id)value;

- (void)startWithDelegate:(id<YTKNetHttpDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
