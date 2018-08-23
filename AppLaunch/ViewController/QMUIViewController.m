//
//  QMUIViewController.m
//  framework
//
//  Created by suger on 2018/8/20.
//  Copyright © 2018 suger. All rights reserved.
//

#import "QMUIViewController.h"
#import "SJUIKit.h"
#import "ControlCenter.h"
#import "Test1ViewController.h"
@protocol Test1Protocol;

@interface QMUIViewController ()

@end

@implementation QMUIViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    
    return self;
}

- (void)setupNavigationItems {
    [super setupNavigationItems];
    self.title = @"QMUI";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QMUIButton *test1 = [SJUIKit buttonWithBackgroundColor:UIColorBlue titleColor:UIColorWhite title:@"测试 1" fontSize:12];
    [self.view addSubview:test1];

    test1.
    whc_CenterToView(CGPointZero, self.view).
    whc_Size(40, 40);

    [test1 target:self action:@selector(doTap_1_action:)];


    // Do any additional setup after loading the view.
}

#pragma mark - Button Action
- (void)doTap_1_action:(id)doTap_1_action {
    [ControlCenter.sharedInstance pushViewControllerProtcol:@protocol(Test1Protocol)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
