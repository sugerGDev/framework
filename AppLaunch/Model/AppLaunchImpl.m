//
// Created by suger on 2018/8/20.
// Copyright (c) 2018 suger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QDCommonUI.h"
#import "AppLaunchImpl.h"
#import "QMUIViewController.h"
#import "LabViewController.h"
#import "ComponentViewController.h"

@AppLordModule(AppLaunchImpl)
@implementation AppLaunchImpl

- (void)moduleDidInit:(ALContext *)context {
  
}

#pragma mark - AppLaunch

- (void)launchApp {

    [self _rendGlobalTheme];
    
    [self _createMainWindow];
}


- (void)_rendGlobalTheme {
    // QD自定义的全局样式渲染
    [QDCommonUI renderGlobalAppearances];
    [[UINavigationBar appearance] setBackgroundImage:QMUICMI.navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
}


- (void)_createMainWindow {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIApplication.sharedApplication.delegate.window = self.window;
    
    self.tabBarController = [[QMUITabBarViewController alloc] init];
    QMUINavigationController *qmuiNavViewController = nil;
    {
        QMUIViewController *qmuiViewController = [[QMUIViewController alloc] init];
        qmuiNavViewController = [[QMUINavigationController alloc] initWithRootViewController:qmuiViewController];
        qmuiNavViewController.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"QMUIKit" image:[UIImageMake(@"icon_tabbar_uikit") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:UIImageMake(@"icon_tabbar_uikit_selected") tag:0];

    }

    QMUINavigationController *labNavigationController = nil;
    {
        LabViewController *labViewController = [[LabViewController alloc] init];
        labNavigationController = [[QMUINavigationController alloc] initWithRootViewController:labViewController];
        labNavigationController.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"Lab" image:[UIImageMake(@"icon_tabbar_lab") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:UIImageMake(@"icon_tabbar_lab_selected") tag:1];
    }

    QMUINavigationController *componentNavViewController = nil;
    {
        ComponentViewController *componentViewController = [[ComponentViewController alloc] init];
        componentNavViewController = [[QMUINavigationController alloc] initWithRootViewController:componentViewController];
        componentNavViewController.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"Components" image:[UIImageMake(@"icon_tabbar_component") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:UIImageMake(@"icon_tabbar_component_selected") tag:2];

    }

    [qmuiNavViewController.navigationBar setBackgroundImage:QMUICMI.navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    self.tabBarController.viewControllers = @[qmuiNavViewController,labNavigationController,componentNavViewController];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
}

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@end
