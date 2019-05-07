//
//  SDUserObject.h
//  SDUserDefaultsDemo
//
//  Created by bnqc on 2019/5/7.
//  Copyright © 2019年 Dong. All rights reserved.
//
// 详情博客: https://www.jianshu.com/p/7005244f83b1

#import "SDCodingObject.h"

@interface SDUserObject : SDCodingObject

/**
 当前对象的标识,只读属性
 */
@property( nonatomic,copy,readonly)NSString *identifier;

/**
 创建一个具有标识符的对象.标识符的作用:归档存储和解档取值的唯一标识.
 @param identifier 唯一标识符
 */
- (instancetype)initWithIdentifier:(NSString *)identifier;

/**
 存储所有的对象属性
 */
- (void)saveAllPropertyAction;

/**
 删除所有的对象属性
 */
- (void)deleteAllPropertyAction;

/**
 弃用init方法
 */
- (instancetype)init DEPRECATED_MSG_ATTRIBUTE("Please use '- (instancetype)initWithIdentifier:(NSString *)identifier' ");

@end

