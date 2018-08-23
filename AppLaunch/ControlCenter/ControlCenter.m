//
// Created by suger on 2018/8/22.
// Copyright (c) 2018 suger. All rights reserved.
//

#import "ControlCenter.h"

NSString *const KControlCenterEntityValueKey = @"ControlCenterEntityValueKey";
NSString *const KControlCenterBlockKey = @"ControlCenterBlockKey";
NSString *const KControlCenterExtendKey = @"ControlCenterBlockKey";

static  dispatch_semaphore_t _semaphore = NULL;

@implementation ControlCenter


+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
        _semaphore = dispatch_semaphore_create(1);
    });

    return _sharedInstance;
}

#pragma mark - Protocol Action

- (BOOL)pushViewControllerProtcol:(Protocol *)aProtocol {
    return [self pushViewControllerProtcol:aProtocol params:nil];
}

- (BOOL)pushViewControllerProtcol:(Protocol *)aProtocol params:(NSDictionary *)params{

    NSObject *object = [[ALContext sharedContext] findService:aProtocol];

//    是否为ViewController 对象
    if (object == nil|| ![object isKindOfClass:UIViewController.class]){
        return NO;
    }

//  是否遵守 ControlCenterIntentDelegate 协议
    if (![object conformsToProtocol:@protocol(ControlCenterIntentDelegate)]) {
        return NO;
    }

  return  [self pushViewController:(UIViewController *)object params:params];
}


#pragma mark - Push Action


- (BOOL)pushViewController:(UIViewController *)viewController {
    return [self pushViewController:viewController params:nil];
}

- (BOOL)pushViewController:(UIViewController *)viewController params:(NSDictionary *)params {
    return [self pushViewController:viewController params:params animated:YES];
 
}

- (BOOL)pushViewController:(UIViewController *)viewController params:(NSDictionary *)params animated:(BOOL)animated {
    if (viewController == nil) {
        return NO;
    }
    [self _passViewController:viewController params:params];
    
//    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [QMUIHelper.visibleViewController.navigationController pushViewController:viewController animated:animated];
//    dispatch_semaphore_signal(_semaphore);
    return YES;
}


- (BOOL)setViewControllers:(NSArray <UIViewController *> *)viewControllers {

    if (!viewControllers.count || ![viewControllers.randomObject isKindOfClass:UIViewController.class ]) {
        return NO;
    }

    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [QMUIHelper.visibleViewController.navigationController setViewControllers:viewControllers animated:NO];
    dispatch_semaphore_signal(_semaphore);
    return YES;
}



#pragma mark - Present Action
- (BOOL)presentViewController:(UIViewController *)viewController {
    return [self presentViewController:viewController params:nil];
}

- (BOOL)presentViewController:(UIViewController *)viewController params:(NSDictionary *)params{
    return [self targetViewController:QMUIHelper.visibleViewController.navigationController presentViewController:viewController params:params];
}


- (BOOL)targetViewController:(UIViewController *)targetViewController presentViewController:(UIViewController *)viewController params:(NSDictionary *)params {
    if (viewController == nil) {
        return NO;
    }
    [self _passViewController:viewController params:params];
    
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [targetViewController presentViewController:viewController animated:YES completion:nil];
    dispatch_semaphore_signal(_semaphore);
    return YES;
}

#pragma mark - Private
- (void)_passViewController:(UIViewController *)viewController params:(NSDictionary *)params {
  
    if ([viewController conformsToProtocol:@protocol(ControlCenterIntentDelegate)]) {
        id <ControlCenterIntentDelegate> delegate = (id<ControlCenterIntentDelegate>) viewController;
        if ( [delegate respondsToSelector:@selector(CC_IntentWithParams:)] ) {
            [delegate CC_IntentWithParams:params];
        }
    }

}
@end
