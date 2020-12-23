//
// BaseRequest.m
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
    

#import "BaseRequest.h"

#import "YTKNetHttpDelegate.h"

@interface BaseRequest() <YTKRequestDelegate> {
    id <YTKNetHttpDelegate> _netDelegate;
}

@end

@implementation BaseRequest

- (NSString *)baseUrl{
    return @"https://egg.simplenglish.cn";
}

-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (void)startWithSuccessBlock:(BaseRequestSuccessBlock)success
                 failureBlock:(BaseRequestfailureBlock)failure {
    
    [super startWithCompletionBlockWithSuccess:^(__kindof BaseRequest * _Nonnull request) {
        
        NSDictionary *json = [request responseJSONObject];
        if (json && [json isKindOfClass:[NSDictionary class]]) {
            
            if (success) {
                success(request, json);
            }
        }
    } failure:^(__kindof BaseRequest * _Nonnull request) {
        
        if (failure) {
            failure(request, nil, @"response nil", 999999);
        }
    }];
}

#pragma mark - 通过代理方式请求
- (void)startWithDelegate:(id<YTKNetHttpDelegate>)delegate {
    _netDelegate = delegate;
    self.delegate = self;
    [self start];
}

#pragma mark - YTKRequestDelegate
- (void)requestFinished:(__kindof YTKBaseRequest *)request {
    
    NSDictionary *json = [request responseJSONObject];
    if (json && [json isKindOfClass:[NSDictionary class]]) {
     
        if ([_netDelegate respondsToSelector:@selector(onRequestFinish:data:)]) {
            [_netDelegate onRequestFinish:request data:json];
        }
    }
    _netDelegate = nil;
}

- (void)requestFailed:(__kindof YTKBaseRequest *)request {
    
    if ([_netDelegate respondsToSelector:@selector(onRequestFail:data:errMsg:errCode:)]) {
        [_netDelegate onRequestFail:request data:nil errMsg:@"reponse nil" errCode:9999];
    }
}

#pragma mark - 添加参数
-(void)addValueForKey:(NSMutableDictionary *)dict key:(NSString *)key value:(id)value {
    if (value) {
        [dict setValue:value forKey:key];
    }
}

@end
