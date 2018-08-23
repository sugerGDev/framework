//
//  Test1ViewController.m
//  framework
//
//  Created by suger on 2018/8/22.
//  Copyright © 2018 suger. All rights reserved.
//

#import "Test1ViewController.h"

@AppLordService(Test1Protocol,Test1ViewController)
@interface Test1ViewController ()<Test1Protocol>

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNavigationItems  {
    [super setupNavigationItems];
    self.title = @"测试 1";
}

- (void)CC_IntentWithParams:(NSDictionary *)params {
    QMUILog(@"",@"param is  %@", params);
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
