//
//  TestUserDefaults.m
//  SDUserDefaultsDemo
//
//  Created by bnqc on 2019/5/7.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "TestUserDefaults.h"

#define TEST_USER_MANAGER @"TEST_USER_MANAGER"

#define TEST_KEY_CHAIN_USER_MANAGER @"TEST_KEY_CHAIN_USER_MANAGER"


@implementation TestUserDefaults

static TestUserDefaults *testDefaults = nil;

+ (instancetype)standardUserDefaults {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (testDefaults == nil) {
            //存放于keychain中的用户数据
            testDefaults = [[TestUserDefaults alloc] initKeychainObjectWithIdentifier:TEST_KEY_CHAIN_USER_MANAGER];
            
            //存放于NSUserDefaults中的用户数据
//            testDefaults = [[TestUserDefaults alloc] initWithIdentifier:TEST_USER_MANAGER];

        }
    });
    return testDefaults;
}


@end
