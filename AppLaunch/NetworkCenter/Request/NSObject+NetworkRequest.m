//
// Created by suger on 2018/8/23.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "NSObject+NetworkRequest.h"
#import "NetworkCenter.h"
#import <YYKit-fork/YYKit.h>

static dispatch_semaphore_t _lock;


#define LOCK(...) \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_lock = dispatch_semaphore_create(1); \
}); \
dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER); \
__VA_ARGS__; \
dispatch_semaphore_signal(_lock);


@implementation NSObject (NetworkRequest)

#pragma mark - Public Action
- (void)asynStartRequest:(NetworkRequest *)request {
    
    if (!request) {
        return;
    }
    
    NetworkCenter *center = NetworkCenter.sharedInstance;
    /**
     *   token过期先发起 token 请求
     */
    if(center.tokenIsExpired) {
        [self queueStartRequest:center.tokenRequest];
        [self queueStartRequest:request];
        
    } else {
        [self _handlerNetworkEventWithRequest:request];
    }
    center = nil;
}

- (void)queueStartRequest:(NetworkRequest *)request {
    
    if (!request) {
        return;
    }
    
    {
        //TODO:处理队列请求逻辑
    }
    
    [request queueReqFlag];
    [self _handlerNetworkEventWithRequest:request];
}

#pragma mark - Private Action
//处理请求策略
- (void)_handlerRequestPolicy:(NetworkRequest *)request {
    
    // 处理移除之前的请求对象
    if (request.requestPolicy == NetworkRequestPolicyReplacePreRequest) {
        
        LOCK(NSArray <NetworkRequest *>*sames = [self querySameRequest:request];
             if (sames.count) {
                 [sames enumerateObjectsUsingBlock:^(NetworkRequest *obj, NSUInteger idx, BOOL *stop) {
                     [obj stop];
                     [self.requests removeObject:obj];
                 }];
             })
    }
}

- (void)_handlerNetworkEventWithRequest:(NetworkRequest *)request {
    
    //处理请求策略
    [self _handlerRequestPolicy:request];
    
    
    YTKRequestCompletionBlock requestCompletionBlock = ^(NetworkRequest *request){
        //TODO:网络请求
        if (request.responseBlock) {
            request.responseBlock(YES, nil);
        }
        [request stop];
        
    };
    LOCK([self.requests addObject:request];)
    
    
#if DEBUG
    sleep(1.f);
    if (requestCompletionBlock) {
        requestCompletionBlock(request);
    }
    
#else
    
    [request setCompletionBlockWithSuccess:requestCompletionBlock failure:requestCompletionBlock];
    [self _startRequest:request];
#endif

    
}

// 因为重载 NetworkRequest 中 -start 方法 所以需要重新实现
- (void)_startRequest:(NetworkRequest *)request {
    
    [request VKCallSelectorName:@"toggleAccessoriesWillStartCallBack" error:nil];
    [[YTKNetworkAgent sharedAgent] addRequest:request];
}

@end


static void  *kRquest;
@implementation NSObject(NetworkReqMap)

- (NSHashTable <NetworkRequest *>*)requests {
    NSHashTable <NetworkRequest *>*requests = [self getAssociatedValueForKey:&kRquest];
    if (requests == nil) {
        requests = [NSHashTable weakObjectsHashTable];
        [self setAssociateValue:requests withKey:&kRquest];
    }
    return requests;
}

- (void)setRequests:(NSHashTable <NetworkRequest *>*)requests {
    NSAssert(1, @"该方法没有实现");
}


- (NSArray <NetworkRequest *>*)querySameRequest:(NetworkRequest *)request {
    //    request.requestUrl
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.requestUrl==%@",request.requestUrl];
    return  [self.requests.allObjects filteredArrayUsingPredicate:predicate];
}



@dynamic requests;
@end



@implementation NSObject(Dealloc)
//+(void)load {
//    [self swizzleInstanceMethod:NSSelectorFromString(@"dealloc") with:@selector(swzzile_dealloc)];
//}
//
//- (void)swzzile_dealloc {
//    NSHashTable <NetworkRequest *>*requests = [self getAssociatedValueForKey:&kRquest];
//    if (requests.count) {
//        [requests.allObjects enumerateObjectsUsingBlock:^(NetworkRequest *obj, NSUInteger idx, BOOL * stop) {
//            [obj stop];
//        }];
//    }
//  
//    [self removeAssociatedValues];
//}
@end

