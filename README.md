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

---

- EBDropdownListView(下拉列表控件)
调用示例
```
    EBDropdownListItem *item1 = [[EBDropdownListItem alloc] initWithItem:@"1" itemName:@"item1"];
    EBDropdownListItem *item2 = [[EBDropdownListItem alloc] initWithItem:@"2" itemName:@"item2"];
    EBDropdownListItem *item3 = [[EBDropdownListItem alloc] initWithItem:@"3" itemName:@"item3"];
    EBDropdownListItem *item4 = [[EBDropdownListItem alloc] initWithItem:@"4" itemName:@"item4"];

    // 弹出框向上
    EBDropdownListView *dropdownListView = [[EBDropdownListView alloc] initWithDataSource:@[item1, item2, item3, item4]];
    dropdownListView.frame = CGRectMake(20, 100, 130, 30);
    [dropdownListView setViewBorder:0.5 borderColor:[UIColor grayColor] cornerRadius:2];
    [self.view addSubview:dropdownListView];
    
    [dropdownListView setDropdownListViewSelectedBlock:^(EBDropdownListView *dropdownListView) {
        NSString *msgString = [NSString stringWithFormat:
                               @"selected name:%@  id:%@  index:%ld"
                               , dropdownListView.selectedItem.itemName
                               , dropdownListView.selectedItem.itemId
                               , dropdownListView.selectedIndex];
        
        msgLabel.text = msgString;
        
    }];
```


![](https://upload-images.jianshu.io/upload_images/2107229-a8418a85fe3afa47.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/360)

[博客地址:https://www.jianshu.com/p/00186b02cb04](https://www.jianshu.com/p/00186b02cb04)

---

- EBCountDownButton(倒计时控件)
调用示例
```
    EBCountDownButton *countDownButton = [[EBCountDownButton alloc] initWithFrame:CGRectMake(100, 100, 140, 40)];
    [countDownButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [countDownButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    countDownButton.backgroundColor = [UIColor colorWithRed:40/255.0 green:207/255.0 blue:155/255.0 alpha:1];
    [countDownButton addTarget:self action:@selector(sendVerificationCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:countDownButton];
```

```
- (void)sendVerificationCode:(EBCountDownButton*)countDownButton {
    [countDownButton countDownWithDuration:5 completion:^(BOOL finished) {
        NSLog(@"finished");
    }];
}
```
![](https://upload-images.jianshu.io/upload_images/2107229-e2a9429fe45983eb.gif?imageMogr2/auto-orient/strip)

[博客地址:https://www.jianshu.com/p/8fc08e9ba283](https://www.jianshu.com/p/8fc08e9ba283)

---

- EBCalendarView(日历控件)
调用示例

```
    EBCalendarView *calendarView = [[EBCalendarView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), 0)];
    calendarView.delegate = self;
    //calendarView.maxLastMonths = 0;  
    //calendarView.maxNextMonths = 0;
    [self.view addSubview:calendarView];
```

```
- (void)calendarView:(EBCalendarView*)calendarView didSelectedDate:(NSDate*)date {
    NSLog(@"选中日期:%@", [date stringWithFormat:@"yyyy-MM-dd"]);
}
```
![](https://upload-images.jianshu.io/upload_images/2107229-f0df4c46723031be.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/360)

[博客地址:https://www.jianshu.com/p/85bbdd0f8251](https://www.jianshu.com/p/85bbdd0f8251)

