//
//  ViewController.m
//  SDUserDefaultsDemo
//
//  Created by bnqc on 2019/4/19.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "ViewController.h"
#import "SDUserDefaults.h"
#import "TestUserDefaults.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addUserInfoAction:(id)sender {
    
    /*****赋值并且保存数据*****/
    [SDUserDefaults standardUserDefaults].name = @"用户数据";
    TextModel *testModel = [[TextModel alloc] init];
    testModel.name = @"骚栋";
    testModel.age = @(15);
    testModel.location = @"北京";
    [SDUserDefaults standardUserDefaults].testModel = testModel;
    
    //不需要归档持久化的数据,只用于本次声明周期中.会有检测过程
//    [SDUserDefaults standardUserDefaults].testModel.unEncodePropertys = @[@"age",@"names"];
    
    [[SDUserDefaults standardUserDefaults] saveAllPropertyAction];
    
    /*****赋值并且保存数据*****/
    [TestUserDefaults standardUserDefaults].name = @"测试数据";
    TextModel *test = [[TextModel alloc] init];
    test.name = @"测试骚栋";
    test.age = @(18);
    test.location = @"测试北京";
    [TestUserDefaults standardUserDefaults].testModel = test;
    
    //不需要归档持久化的数据,只用于本次声明周期中.会有检测过程
    //    [SDUserDefaults standardUserDefaults].testModel.unEncodePropertys = @[@"age",@"names"];
    
    [[TestUserDefaults standardUserDefaults] saveAllPropertyAction];
    
}

- (IBAction)showUserInfoAction:(id)sender {
    
    /*****获取数据*****/
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].name);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.name);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.age);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.location);
    
    
    NSLog(@"%@",[TestUserDefaults standardUserDefaults].name);
    NSLog(@"%@",[TestUserDefaults standardUserDefaults].testModel.name);
    NSLog(@"%@",[TestUserDefaults standardUserDefaults].testModel.age);
    NSLog(@"%@",[TestUserDefaults standardUserDefaults].testModel.location);
    
}

- (IBAction)deleteUserInfoAction:(id)sender {
    
    /*****删除数据*****/
    [[SDUserDefaults standardUserDefaults] deleteAllPropertyAction];
    
    [[TestUserDefaults standardUserDefaults] deleteAllPropertyAction];
}




@end
