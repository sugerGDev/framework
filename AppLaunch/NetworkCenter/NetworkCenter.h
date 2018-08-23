//
// Created by suger on 2018/8/23.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkRequest.h"
#import "VKMsgSend.h"
/**
 * 网路请求，负责调度
 * 不负责业务逻辑实现
 * 提供 token 刷新机制
 */
@interface NetworkCenter : NSObject
+ (instancetype)sharedInstance;


@end



@interface NetworkCenter(Token)
- (NetworkRequest *)tokenRequest;
- (BOOL)tokenIsExpired;
- (NSString *)uniqueToken;
- (void)saveToken:(NSString *)sToken;

@end
