//
//  SDKeychainUserDefaults.m
//  SDUserDefaultsDemo
//
//  Created by bnqc on 2019/5/8.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "SDKeychainUserDefaults.h"

#define SD_KEY_CHAIN_USER_MANAGER @"SD_KEY_CHAIN_USER_MANAGER"

@implementation SDKeychainUserDefaults

static SDKeychainUserDefaults *userDefaults = nil;

+ (instancetype)standardUserDefaults {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (userDefaults == nil) {
            userDefaults = [[SDKeychainUserDefaults alloc] initKeychainObjectWithIdentifier:SD_KEY_CHAIN_USER_MANAGER];
        }
    });
    return userDefaults;
}

#pragma mark - 赋值方法,可根据实际情况自行修改

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    [super setValue:value forKey:key];
}


@end
