//
//  ViewController.m
//  EBNumberTextFieldDemo
//
//  Created by HoYo on 2018/5/12.
//  Copyright © 2018年 HoYo. All rights reserved.
//

#import "ViewController.h"
#import "EBNumberTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTextField:EBNumberKeyboardTypeDefault title:@"系统键盘"];
    [self createTextField:EBNumberKeyboardTypeInteger title:@"有符号整数"];
    [self createTextField:EBNumberKeyboardTypeUInteger title:@"无符号整数"];
    [self createTextField:EBNumberKeyboardTypeDecimal title:@"有符号小数"];
    [self createTextField:EBNumberKeyboardTypeUDecimal title:@"无符号小数"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createTextField:(EBNumberKeyboardType)keyboardType title:(NSString*)title  {
    static CGFloat y = 100;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, y, 100, 30)];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.text = title;
    [self.view addSubview:titleLabel];
    
    EBNumberTextField *textField = [[EBNumberTextField alloc] initWithFrame:CGRectMake(115, y, 150, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.numberKeyboardType = keyboardType;
    textField.maxLength = 5;
    [self.view addSubview:textField];
    y += 40;
}

@end
