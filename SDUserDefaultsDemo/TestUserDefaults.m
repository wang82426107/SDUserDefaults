//
//  TestUserDefaults.m
//  SDUserDefaultsDemo
//
//  Created by bnqc on 2019/5/7.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "TestUserDefaults.h"

#define TEST_USER_MANAGER @"TEST_USER_MANAGER"

@implementation TestUserDefaults

static TestUserDefaults *testDefaults = nil;

+ (instancetype)standardUserDefaults {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (testDefaults == nil) {
            testDefaults = [[TestUserDefaults alloc] initWithIdentifier:TEST_USER_MANAGER];
        }
    });
    return testDefaults;
}


@end
