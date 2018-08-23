//
// Created by suger on 2018/8/20.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppLord/AppLord.h>
#import <QMUIKit/QMUIKit.h>

@protocol AppLaunch <ALModule>

//保存Main-Window
@property(nonatomic, strong) UIWindow *window;

//保存Main-TabbarController
@property(nonatomic, strong) QMUITabBarViewController *tabBarController;

//启动App方法
- (void)launchApp;

@end


/**
 * App启动配置实现方法
 */
@interface AppLaunchImpl : NSObject<AppLaunch>

@end



typedef  id<AppLaunch> AppLaunchService;
