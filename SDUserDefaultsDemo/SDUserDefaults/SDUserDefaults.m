//
//  SDUserDefaults.m
//  staveDemo
//
//  Created by bnqc on 2019/4/19.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "SDUserDefaults.h"
#import <objc/runtime.h>

#define SD_USER_MANAGER @"SD_USER_MANAGER"

@implementation SDUserDefaults

static SDUserDefaults *userDefaults = nil;

+ (instancetype)standardUserDefaults {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (userDefaults == nil) {
            userDefaults = [SDUserDefaults initUserInfoAction];
        }
    });
    
    return userDefaults;
}

+ (instancetype)initUserInfoAction {
    
    NSData *userInfoData = [[NSUserDefaults standardUserDefaults] objectForKey:SD_USER_MANAGER];
    if (userInfoData == nil) {
        return [[SDUserDefaults alloc] init];
    } else {
        SDUserDefaults * userInitDefaults = nil;
        @try {
            userInitDefaults = [NSKeyedUnarchiver unarchiveObjectWithData:userInfoData];
        } @catch (NSException *exception) {
            if ([exception.name isEqualToString:@"NSInvalidArgumentException"]) {
                NSLog(@"未遵循NSCoding协议错误,请查看下面的错误日志中的类名👇👇👇");
                @throw exception;
            } else {
                NSLog(@"其他错误,请查看下面的错误日志👇👇👇");
                @throw exception;
            }
        }
        return userInitDefaults;
    }
}

- (void)saveUserInfoAction {
    
    NSData *userInfoData = [NSKeyedArchiver archivedDataWithRootObject:userDefaults];
    [[NSUserDefaults standardUserDefaults] setObject:userInfoData forKey:SD_USER_MANAGER];
}

- (void)deleteUserInfo {
    
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t *thisProperty = &propertyList[i];
        const char *name = property_getName(*thisProperty);
        NSString *propertyName = [NSString stringWithFormat:@"%s",name];
        [self setValue:nil forKey:propertyName];
    }
    free(propertyList);
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:SD_USER_MANAGER];
}

#pragma mark - 赋值方法,可根据实际情况自行修改

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    [super setValue:value forKey:key];
}


@end

