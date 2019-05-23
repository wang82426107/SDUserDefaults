> ##### All attributes must follow the NSCoding protocol, including the elements in the array member variables and dictionary member variables. The custom class can inherit from SDCodingObject. The Foundation of the base class is implemented NSCoding protocol methods.

[中文文档](https://github.com/wang82426107/SDUserDefaults/blob/master/README_CHINESE.md)

<br>

#### Import mode

***

Manual import: Download the Demo and SDUserDefaults. Import the SDUserDefaults folder into the appropriate location for your own project.

Cocoapod import: The method is shown below.

```
pod 'SDUserDefaults'
```
next  `pod install`


<br>


#### Basic usage (manual import is recommended)

***

1.Download and import SDUserDefaults.

2.Add the properties you want to store in the SDUserDefaults.h file. The important thing to note here is that the properties must be NSCoding compliant classes, which are already in Foundation.

![](https://upload-images.jianshu.io/upload_images/1396375-ba4ce6329628bf3d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


At this point someone asks, what do I need to do with my custom class? Do I need to implement **- (void)encodeWithCoder** and **- (instancetype)initWithCoder** methods in the NSCoding protocol? Absolutely not! You need to inherit from the SDCodingObject class, where I've implemented the NSCoding protocol, and all the properties are archived, such as the TestModel class shown above. The code is shown below.

![](https://upload-images.jianshu.io/upload_images/1396375-9494527a5cbc24cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.**Save Data**: we simply assign the corresponding property and call the saveUserInfoAction method. The code is shown below.
```
[SDUserDefaults standardUserDefaults].name = @"用户数据";
TextModel *testModel = [[TextModel alloc] init];
testModel.name = @"骚栋";
testModel.age = @(15);
testModel.location = @"北京";
[SDUserDefaults standardUserDefaults].testModel = testModel;
[[SDUserDefaults standardUserDefaults] saveAllPropertyAction]; // 存储数据
```

4.**Get Data**:The code is shown below.

```
/*****获取数据*****/
NSLog(@"%@",[SDUserDefaults standardUserDefaults].name);
NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.name);
NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.age);
NSLog(@"%@",[SDUserDefaults standardUserDefaults].testModel.location);
```

5.**Delete All Data**:The code is shown below.

```
[[SDUserDefaults standardUserDefaults] deleteAllPropertyAction];
```

6.**Update Data**:If you want to delete a property, set that property to nil; If you want to modify a property, modify that property and save it by calling **saveAllPropertyAction**.

```
[SDUserDefaults standardUserDefaults].name = @"新的用户数据";
[SDUserDefaults standardUserDefaults].testModel.location = nil;
[[SDUserDefaults standardUserDefaults] saveAllPropertyAction]; // 更新数据
```

7.**Ignore Archive Attributes**:What if you don't want some properties to be archived and persisted? Use unEncodePropertys. If you add an ignored attribute name, the attribute will not be archived. Note that you should ignore before using **saveAllPropertyAction** as far as possible.

```
[SDUserDefaults standardUserDefaults].testModel.unEncodePropertys = @[@"age",@"names"];
```


<br>

#### Custom usage (import mode recommended: manual import and cocoapods are also available)
***

A lot of people would say, why should I initialize with your SDUserDefaults, I just want to write my own UserDefaults singleton to manage my own storage properties, can't I?

OK, of course. In version 1.0.3, I added a new class called the SDUserObject class, which only needs the singleton you wrote to inherit from the class and initialize it with the -(instancetype) initWithIdentifier method. Then you can still use powerful properties, But the amount of code you write will be greatly reduced. Let's take a look at how the examples in Demo are used.

We need the singleton class to inherit from the SDUserObject class, as shown in the figure below.

![](https://upload-images.jianshu.io/upload_images/1396375-a71856bfbdf346c3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Then, when creating the singleton, it needs to be initialized using the **- (instancetype)initWithIdentifier** method, as shown below.
![](https://upload-images.jianshu.io/upload_images/1396375-b12a83d3e91037af.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Use **saveAllPropertyAction** and **deleteAllPropertyAction** on the save and delete methods.

![](https://upload-images.jianshu.io/upload_images/1396375-6f81b7850d7c2f44.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

<br>

#### SDUserDefaults stored in Keychain

***

In version 1.0.6, I have added Keychain storage. We can implement Keychain storage in two ways.

* When manually importing SDUserDefaults, we can modify the **SDKeychainUserDefaults**, using the same methods as the **SDUserDefaults** class. However, the storage location of **SDKeychainUserDefaults** is in the Keychain, not in NSUserDefaults.

![](https://upload-images.jianshu.io/upload_images/1396375-00b5ca718825fcc6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


* Cocoapods import way only need to use **initKeychainObjectWithIdentifier:**. As shown below. You can view the Demo of TestUserDefaults initialization method.

![](https://upload-images.jianshu.io/upload_images/1396375-276484c0049f98e0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


<br>

[SDUserDefaults Blog](https://www.jianshu.com/p/7005244f83b1)

<br>

[参与修订者：贾璐]()



