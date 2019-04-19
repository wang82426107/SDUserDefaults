//
//  SDCodingObject.m
//  staveDemo
//
//  Created by bnqc on 2019/4/19.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "SDCodingObject.h"
#import <objc/runtime.h>
#import "TextModel.h"

@implementation SDCodingObject

- (instancetype)init {
    
    if (self = [super init]) {
        [self testPropertyConformsToNSCodingProtocol];
    }
    return self;
}

// 检测所有成员变量是否遵循NSCoding协议
- (void)testPropertyConformsToNSCodingProtocol {
    
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t thisProperty = propertyList[i];
        const char * type = property_getAttributes(thisProperty);
        NSString * typeString = [NSString stringWithUTF8String:type];
        NSArray * attributes = [typeString componentsSeparatedByString:@","];
        NSString * typeAttribute = [attributes objectAtIndex:0];
        if ([typeAttribute hasPrefix:@"T@"] && [typeAttribute length] > 1) {
            NSString * typeClassName = [typeAttribute substringWithRange:NSMakeRange(3, [typeAttribute length]-4)];  //turns @"NSDate" into NSDate
            Class typeClass = NSClassFromString(typeClassName);
            
            BOOL isConforms = [typeClass conformsToProtocol:@protocol(NSCoding)];
            if (!isConforms) {
                NSString *exceptionContent = [NSString stringWithFormat:@"%@ 类中的 %@属性 未遵循NSCoding协议,请手动调整",NSStringFromClass([self class]),typeClassName];
                @throw [NSException exceptionWithName:@"property has not NSCoding Protocol" reason:exceptionContent userInfo:nil];
            }
        }
    }
    free(propertyList);
}

#pragma mark - 归档与解档

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t *thisProperty = &propertyList[i];
        const char *name = property_getName(*thisProperty);
        NSString *propertyName = [NSString stringWithFormat:@"%s",name];
        id propertyValue = [self valueForKey:propertyName];
        [aCoder encodeObject:propertyValue forKey:propertyName];
    }
    free(propertyList);
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    
    if (self = [super init]) {
        
        unsigned int propertyCount = 0;
        objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
        for (int i = 0; i < propertyCount; i++) {
            objc_property_t *thisProperty = &propertyList[i];
            const char *name = property_getName(*thisProperty);
            NSString *propertyName = [NSString stringWithFormat:@"%s",name];
            [self setValue:[aDecoder decodeObjectForKey:propertyName] forKey:propertyName];
        }
        free(propertyList);
    }
    return self;
}


@end
