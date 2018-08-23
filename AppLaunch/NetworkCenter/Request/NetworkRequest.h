//
// Created by suger on 2018/8/23.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKBaseRequest.h"
#import "NetworkResponse.h"

//网路请求Block
typedef void (^NetworkCompletedBlock)(BOOL isSuccess, NetworkResponse *response);


//  请求策略
typedef NS_ENUM(NSInteger,NetworkRequestPolicy){
//    保留两个请求对象
    NetworkRequestPolicyBothRequests = 0,
//    替换之前的请求对象
    NetworkRequestPolicyReplacePreRequest = 1,
};

@interface NetworkRequest : YTKBaseRequest

//请求策略 默认 NetworkRequestPolicyBothRequests
@property (nonatomic, assign)NetworkRequestPolicy requestPolicy;
/**
 网路请求返回 Block
 */
@property(nonatomic, copy,readonly)NetworkCompletedBlock responseBlock;



- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithResponseBlock:(NetworkCompletedBlock)responseBlock;

- (void)start;
- (void)stop;


/**
 设置是队列请求
 */
- (void)queueReqFlag;

/**
 是队列请求
 @return 是否是队列请求
 */
- (BOOL)isQueueReq;

@end
