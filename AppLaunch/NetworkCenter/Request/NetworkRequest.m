//
// Created by suger on 2018/8/23.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <QMUIKit/QMUILog.h>
#import "NetworkRequest.h"


@interface NetworkRequest ()

/**
 网路请求返回 Block
 */
@property(nonatomic, copy)NetworkCompletedBlock responseBlock;


@property(nonatomic, assign) BOOL isQueueRequest;
@end

@implementation NetworkRequest
- (instancetype)initWithResponseBlock:(NetworkCompletedBlock)responseBlock {
    self = [super init];
    if (self) {
        self.isQueueRequest = NO;
        self.responseBlock = responseBlock;
        self.requestPolicy = NetworkRequestPolicyBothRequests;
    }

    return self;
}

- (void)stop {
    self.responseBlock = nil;
    [super stop];
}

- (void)start {
    QMUILogWarn(@"",@"该方法重置，请使用 -startWithRequest:");
}

- (void)queueReqFlag {
    self.isQueueRequest = YES;
}

- (BOOL)isQueueReq {
    return self.isQueueRequest;
}


@end
