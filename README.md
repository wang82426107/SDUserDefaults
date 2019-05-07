> ##### 所有属性必须遵循NSCoding协议!!!! 包括数组成员变量以及字典成员变量中的元素!!!! 
> ##### 所有属性必须遵循NSCoding协议!!!! 包括数组成员变量以及字典成员变量中的元素!!!! 
> ##### 所有属性必须遵循NSCoding协议!!!! 包括数组成员变量以及字典成员变量中的元素!!!! 




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

7.**更新数据**:想要删除的话,就把那个属性置为nil,想要修改某个属性就把那个属性修改,最后调用**saveUserInfoAction**方法保存即可.

```
    [SDUserDefaults standardUserDefaults].name = @"新的用户数据";
    [SDUserDefaults standardUserDefaults].testModel.location = nil;
    [[SDUserDefaults standardUserDefaults] saveUserInfoAction]; // 更新数据
```

8.**忽略归档属性**:不想让部分属性进行归档持久化怎么办?使用 **unEncodePropertys** 即可.添加忽略的属性名称则该属性不会进行归档操作,注意,要忽略尽量在
**saveUserInfoAction**前使用吆~

```
    [SDUserDefaults standardUserDefaults].testModel.unEncodePropertys = @[@"age",@"names"];
```

<br>

#### SDUserDefaults 自定义使用

***

有很多的童鞋会说,我凭啥要用你的SDUserDefaults来初始化啊,我就想自己写一个UserDefaults单例来管理我自己的存储属性不行啊?

行,当然可以了,在1.0.3版本的时候,骚栋增加了一个新的类,叫做SDUserObject类,只需要你写的单例继承于这个类,并且使用 **- (instancetype)initWithIdentifier** 方法来初始化,那么依然可以使用强大的属性,但是自己书写的代码量会大大减少.我们来看一下Demo中的例子是如何使用的吧.

基本操作什么的,还是如同上一个模块一样.我们来看一下存储的单例类是定义的.我们需要让单例类继承于**SDUserObject**类,如下图所示.

![](https://upload-images.jianshu.io/upload_images/1396375-a71856bfbdf346c3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

然后在创建单例的时候需要使用带有标识符参数的 **- (instancetype)initWithIdentifier** 方法进行初始化.如下图所示.

![](https://upload-images.jianshu.io/upload_images/1396375-b12a83d3e91037af.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

然后在保存和删除的方法上使用**saveAllPropertyAction** 和 **deleteAllPropertyAction** 即可.

![](https://upload-images.jianshu.io/upload_images/1396375-6f81b7850d7c2f44.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


<br>

这里对几个问题做一下解释.

* 为什么会有SDUserObject类的出现? 

答:后期的SDUserDefaults会使用cocospod进行管理,那么到时候如果通过cocospod引入的时候不能去改动源码吧,所以我们通过继承于SDUserObject的方式来使用SDUserDefaults这个三方,同时呢,现在手动导入的方式,也会有很多童鞋有这样的自定义类的需求,所以SDUserObject的出现是很有必要的~

* 为什么在初始化SDUserObject类或者子类的时候需要使用**- (instancetype)initWithIdentifier**这个带有标识符的初始化方法呢?

答:唯一标识符identifier的作用是做了存储的key来使用的.如果有的童鞋写了两个单例类,但是用了相同的identifier就会出现数据错乱问题,所以这里我把这个唯一标识符暴露在.h属性中,用于个别童鞋进行单独的定制.只要保证全局唯一即可.




<br>

#### 历史版本

* 1.0.0 SDUserDefaults初次创建

* 1.0.1 SDUserDefaults对数组中的元素是否遵循NSCoding协议进行的提示完善

* 1.0.2 添加忽略归档数组unEncodePropertys,可忽略部分属性进行归档操作.

* 1.0.3 新增SDUserObject类,用于自定义单例类使用.

<br>

SDUserDefaults交流反馈QQ群: 214575341

[点击查看博客](https://www.jianshu.com/p/7005244f83b1)


