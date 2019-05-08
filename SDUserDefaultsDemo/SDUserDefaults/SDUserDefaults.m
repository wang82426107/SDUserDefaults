//
//  SDUserDefaults.m
//  staveDemo
//
//  Created by bnqc on 2019/4/19.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "SDUserDefaults.h"

#define SD_USER_MANAGER @"SD_USER_MANAGER"

@implementation SDUserDefaults

static SDUserDefaults *userDefaults = nil;

+ (instancetype)standardUserDefaults {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (userDefaults == nil) {
            userDefaults = [[SDUserDefaults alloc] initWithIdentifier:SD_USER_MANAGER];
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

