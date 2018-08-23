//
// Created by suger on 2018/8/22.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <AppLord/AppLord.h>
#import <AppLord/ALMacros.h>

#import <YYKit-fork/YYKit.h>
#import <QMUIKit/QMUIKit.h>

/**
 *  Dictionary 数据 KEY 限定
 */

// 传递实体 KEY
UIKIT_EXTERN NSString *const KControlCenterEntityValueKey;

// 传递Block KEY
UIKIT_EXTERN NSString *const KControlCenterBlockKey;

// 传递扩展数据 KEY
UIKIT_EXTERN NSString *const KControlCenterExtendKey;

/**
 * 数据传递协议
 */
@protocol ControlCenterIntentDelegate <ALService>

@optional
- (void)CC_IntentWithParams:(NSDictionary *)params;
@end


/**
Controller 管理器
 **/
@interface ControlCenter : NSObject

+ (instancetype)sharedInstance;

- (BOOL)pushViewControllerProtcol:(Protocol*)aProtocol;
- (BOOL)pushViewControllerProtcol:(Protocol*)aProtocol params:(NSDictionary *)params;


- (BOOL)pushViewController:(UIViewController *)viewController;
- (BOOL)pushViewController:(UIViewController *)viewController params:(NSDictionary *)params;
- (BOOL)pushViewController:(UIViewController *)viewController params:(NSDictionary *)params animated:(BOOL)animated;
- (BOOL)setViewControllers:(NSArray <UIViewController *>*)viewControllers;

- (BOOL)presentViewController:(UIViewController *)viewController;
- (BOOL)presentViewController:(UIViewController *)viewController  params:(NSDictionary *)params;
- (BOOL)targetViewController:(UIViewController *)targetViewController  presentViewController:(UIViewController *)viewController  params:(NSDictionary *)params;

@end
