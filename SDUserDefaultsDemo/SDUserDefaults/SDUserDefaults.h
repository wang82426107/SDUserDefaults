//
//  SDUserDefaults.h
//  staveDemo
//
//  Created by bnqc on 2019/4/19.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "SDCodingObject.h"
#import "TextModel.h"
@interface SDUserDefaults : SDCodingObject

// SDUserDefaults 是用户偏好设置存储单例对象.

+ (instancetype)standardUserDefaults;

/**
 存储用户偏好设置
 */
- (void)saveUserInfoAction;

/**
 删除用户偏好设置
 */
- (void)deleteUserInfo;

// 请在下方添加你所需要保存的属性,注意要遵循NSCoding协议,或者继承于SDCodingObject类 ❗️❗️❗️❗️❗️暂不支持int,float,BOOL等类型❗️❗️❗️❗️❗️

@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)TextModel *testModel;

@end

