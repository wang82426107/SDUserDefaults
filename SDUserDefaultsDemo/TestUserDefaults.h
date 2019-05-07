//
//  TestUserDefaults.h
//  SDUserDefaultsDemo
//
//  Created by bnqc on 2019/5/7.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "SDUserObject.h"
#import "TestErrorModel.h"
#import "TextModel.h"
@interface TestUserDefaults : SDUserObject

// TestUserDefaults 是自定义的单例类,继承于SDUserObject

+ (instancetype)standardUserDefaults;

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *password;
@property(nonatomic,strong)TextModel *testModel;

//@property(nonatomic,strong)TestErrorModel *testErrorModel;

@end

