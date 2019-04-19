//
//  ViewController.m
//  SDUserDefaultsDemo
//
//  Created by bnqc on 2019/4/19.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "ViewController.h"
#import "SDUserDefaults.h"

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
    [[SDUserDefaults standardUserDefaults] saveUserInfoAction];
}

- (IBAction)showUserInfoAction:(id)sender {
    
    /*****获取数据*****/
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].name);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.name);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.age);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.location);
}

- (IBAction)deleteUserInfoAction:(id)sender {
    
    /*****删除数据*****/
    [[SDUserDefaults standardUserDefaults] deleteUserInfo];
}




@end
