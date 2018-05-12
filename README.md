# EBCustomControls
Custom controls for iOS

- EBNumberTextField(自定义数字键盘)

调用示例
```
    EBNumberTextField *textField = [[EBNumberTextField alloc] initWithFrame:CGRectMake(115, y, 150, 30)];
    // 键盘类型
    textField.numberKeyboardType = EBNumberKeyboardTypeInteger;
    // 文本长度
    textField.maxLength = 5;
    [self.view addSubview:textField];
```
![EBNumberTextField.gif](https://upload-images.jianshu.io/upload_images/2107229-af7e6c6c2aabbfa6.gif?imageMogr2/auto-orient/strip)

[博客地址:https://www.jianshu.com/p/d7c17a9bbf14](https://www.jianshu.com/p/d7c17a9bbf14)
