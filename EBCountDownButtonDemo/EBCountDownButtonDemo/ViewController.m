//
//  ViewController.m
//  EBCountDownButtonDemo
//
//  Created by HoYo on 2018/4/24.
//  Copyright © 2018年 HoYo. All rights reserved.
//

#import "ViewController.h"
#import "EBCountDownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EBCountDownButton *countDownButton = [[EBCountDownButton alloc] initWithFrame:CGRectMake(100, 100, 140, 40)];
    [countDownButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [countDownButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    countDownButton.backgroundColor = [UIColor colorWithRed:40/255.0 green:207/255.0 blue:155/255.0 alpha:1];
    [countDownButton addTarget:self action:@selector(sendVerificationCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:countDownButton];
}

- (void)sendVerificationCode:(EBCountDownButton*)countDownButton {
    [countDownButton countDownWithDuration:5 completion:^(BOOL finished) {
        NSLog(@"finished");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
