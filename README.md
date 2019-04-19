#### 使用方式


1.下载演示Demo以及**SDUserDefaults**.

2.把SDUserDefaults文件夹导入你自己的项目合适位置,文件夹中主要包含**SDUserDefaults**和**SDCodingObject**两个类.

![](https://upload-images.jianshu.io/upload_images/1396375-0e131b74ca222ed7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.在**SDUserDefaults**的.h文件中添加你想要存储的属性,这里需要注意的是属性必须是遵循NSCoding协议的类,Foundation中的类都已经遵循该协议.如下图所示.

![](https://upload-images.jianshu.io/upload_images/1396375-ba4ce6329628bf3d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


这时候有人会问,那我自定义的类需要怎么办?难道我需要自己实现NSCoding协议中的**- (void)encodeWithCoder**和**- (instancetype)initWithCoder**方法吗?完全不需要!你需要继承于**SDCodingObject**这个类即可,我在其中都做了NSCoding协议的实现,并且所有的属性都会进行归档操作.例如上图的TestModel类.代码如下所示.

![](https://upload-images.jianshu.io/upload_images/1396375-9494527a5cbc24cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4.**存储数据**:只需要我们把对应的属性进行赋值,然后调用**saveUserInfoAction**方法即可.代码如下所示.

```
    [SDUserDefaults standardUserDefaults].name = @"用户数据";
    TextModel *testModel = [[TextModel alloc] init];
    testModel.name = @"骚栋";
    testModel.age = @(15);
    testModel.location = @"北京";
    [SDUserDefaults standardUserDefaults].testModel = testModel;
    [[SDUserDefaults standardUserDefaults] saveUserInfoAction]; // 存储数据
```

5.**获取数据**:直接取值就好,简单粗暴,没有任何问题.代码如下所示.

```
    /*****获取数据*****/
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].name);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.name);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.age);
    NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.location);
```

6.**删除数据**:想要删除数据直接调用**deleteUserInfo**即可.

```
    [[SDUserDefaults standardUserDefaults] deleteUserInfo];
```
