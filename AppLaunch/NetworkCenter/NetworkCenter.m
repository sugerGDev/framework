//
// Created by suger on 2018/8/23.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <YTKNetwork/YTKNetworkAgent.h>
#import "NetworkCenter.h"


@implementation NetworkCenter {

}
+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

@end


@implementation NetworkCenter(Token)

- (NetworkRequest *)tokenRequest {
    return nil;
}

- (BOOL)tokenIsExpired {
    return NO;
}

- (NSString *)uniqueToken {
    return nil;
}

- (void)saveToken:(NSString *)sToken {

}

@end
