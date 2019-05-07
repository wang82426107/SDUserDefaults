//
//  SDUserObject.m
//  SDUserDefaultsDemo
//
//  Created by bnqc on 2019/5/7.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "SDUserObject.h"
#import <objc/runtime.h>

@implementation SDUserObject

- (instancetype)initWithIdentifier:(NSString *)identifier {
    
    NSData *userInfoData = [[NSUserDefaults standardUserDefaults] objectForKey:identifier];
    if (userInfoData == nil) {
        if (self = [super init]) {
            _identifier = identifier;
        }
    } else {
        @try {
            self = [NSKeyedUnarchiver unarchiveObjectWithData:userInfoData];
            _identifier = identifier;
        } @catch (NSException *exception) {
            if ([exception.name isEqualToString:@"NSInvalidArgumentException"]) {
                NSLog(@"未遵循NSCoding协议错误,请查看下面的错误日志中的类名👇👇👇");
                @throw exception;
            } else {
                NSLog(@"其他错误,请查看下面的错误日志👇👇👇");
                @throw exception;
            }
        }
    }
    return self;
}

- (void)saveAllPropertyAction {
    
    NSData *allPropertyData = [NSKeyedArchiver archivedDataWithRootObject:self];
    [[NSUserDefaults standardUserDefaults] setObject:allPropertyData forKey:_identifier];
}

- (void)deleteAllPropertyAction {
    
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t *thisProperty = &propertyList[i];
        const char *name = property_getName(*thisProperty);
        NSString *propertyName = [NSString stringWithFormat:@"%s",name];
        [self setValue:nil forKey:propertyName];
    }
    free(propertyList);
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:_identifier];
}

- (instancetype)init {
    
    if (self = [super init]) {
        NSString *exceptionContent = [NSString stringWithFormat:@"%@ 类中已经把init初始化弃用了,请用'- (instancetype)initWithIdentifier:(NSString *)identifier'来进行初始化操作 ",NSStringFromClass([self class])];
        @throw [NSException exceptionWithName:@"method is deprecated" reason:exceptionContent userInfo:nil];
    }
    return self;
}


@end
