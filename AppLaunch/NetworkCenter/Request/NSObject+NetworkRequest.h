//
// Created by suger on 2018/8/23.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkRequest;
@class YYThreadSafeArray;

@interface NSObject (NetworkRequest)
/**
 * 异步发起请求
 * @param request  请求对象
 */
- (void)asynStartRequest:(NetworkRequest *)request ;
/**
 * 异步发起请求，队列返回
 * @param request  请求对象
 */
- (void)queueStartRequest:(NetworkRequest *)request ;

@end


//当前保存请求兑现
@interface NSObject (NetworkReqMap)
@property (nonatomic, strong)NSHashTable <NetworkRequest *>*requests;
/**
 * 根据 URI比较返回结果
 * @param request 该请求结果
 * @return 是否返回相同URI集合
 */
- (NSArray <NetworkRequest *>*)querySameRequest:(NetworkRequest *)request;
@end


@interface NSObject(Dealloc)
@end

