//
// Created by suger on 2018/8/23.
// Copyright (c) 2018 suger. All rights reserved.
//

#import "_NetworkReqTask.h"


@implementation _NetworkReqTask
- (void)executeTask {

    [self finishWithError:nil];
}

- (BOOL)needMainThread
{
    return NO;
}


@end