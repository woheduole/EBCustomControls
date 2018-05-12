//
//  EBNumberKeyboardView.m
//  eBest_KA_Pro
//
//  Created by HoYo on 2018/5/8.
//  Copyright © 2018年 com.ebest. All rights reserved.
//

#import "EBNumberKeyboardView.h"

#define kEBScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kEBScreenHeight [[UIScreen mainScreen] bounds].size.height

CGFloat const kEBNumberKeyboardViewHeight = 150;
CGFloat const kEBNumberKeyboardViewColumns = 5; // 5列
CGFloat const kEBNumberKeyboardViewLineSpace = 1; // 间距
NSString *const kEBNumberKeyboardViewDeleteKey = @"退格";
NSString *const kEBNumberKeyboardViewClearKey = @"清空";
NSString *const kEBNumberKeyboardViewDoneKey = @"完成";
NSString *const kEBNumberKeyboardViewMinusKey = @"-";
NSString *const kEBNumberKeyboardViewDotKey = @".";

@implementation EBNumberKeyboardView
- (instancetype)initWithKeyboardType:(EBNumberKeyboardType)keyboardType {
    if (self = [super init]) {
        self.frame = CGRectMake(0, kEBScreenHeight, kEBScreenWidth, kEBNumberKeyboardViewHeight);
        self.backgroundColor = [UIColor colorWithRed:30 / 255.0 green:33 / 255.0 blue:35 / 255.0 alpha:1];
        _keyboardType = keyboardType;
        [self calcKeyboardLayout];
    }
    return self;
}

- (void)calcKeyboardLayout {
    NSArray *buttonTexts = @[@"1", @"2", @"3", kEBNumberKeyboardViewMinusKey, kEBNumberKeyboardViewDeleteKey, @"4", @"5", @"6", @"0", kEBNumberKeyboardViewClearKey, @"7", @"8", @"9", kEBNumberKeyboardViewDotKey, kEBNumberKeyboardViewDoneKey];
    NSInteger counts = buttonTexts.count;
    NSInteger rows = ceilf(counts / kEBNumberKeyboardViewColumns);
    CGFloat buttonWidth = (kEBScreenWidth - (kEBNumberKeyboardViewColumns - 1) * kEBNumberKeyboardViewLineSpace) / kEBNumberKeyboardViewColumns ;
    CGFloat buttonHeight = (kEBNumberKeyboardViewHeight - (rows - 1) * kEBNumberKeyboardViewLineSpace) / rows;
    CGFloat buttonX = 0, buttonY = 0;
    NSInteger index = 0;
    for (int rowIndex = 1; rowIndex <= rows; rowIndex++) {
        if (rowIndex > 1) {
            buttonY += buttonHeight + kEBNumberKeyboardViewLineSpace;
        }
        buttonX = 0;
        for (int colIndex = 1; colIndex <= kEBNumberKeyboardViewColumns; colIndex ++) {
            if (index >= counts) break;
            if (colIndex > 1) {
                buttonX += buttonWidth + kEBNumberKeyboardViewLineSpace;
            }
            NSString *text = buttonTexts[index];
            CGRect frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
            [self addButtonWithFrame:frame text:text];
            index ++;
        }
    }
}

#pragma mark - Events
- (void)buttonClicked:(UIButton*)button {
    NSString *text = button.currentTitle;
    
    BOOL allowInput = [self checkInput:text];
    
    if (!allowInput) return;
    
    [self execDelegate:text];
}

#pragma mark - Methods

- (void)addButtonWithFrame:(CGRect)frame text:(NSString*)text {
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:text forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if ([text isEqualToString:kEBNumberKeyboardViewDeleteKey]
        || [text isEqualToString:kEBNumberKeyboardViewDoneKey]
        || [text isEqualToString:kEBNumberKeyboardViewClearKey]) {
        button.titleLabel.font = [UIFont systemFontOfSize:16];
    }else {
        button.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    if ([text isEqualToString:kEBNumberKeyboardViewDoneKey]) {
        button.backgroundColor = [UIColor colorWithRed:17 / 255.0 green:208 / 255.0 blue:165 / 255.0 alpha:1];
    }else{
        button.backgroundColor = [UIColor colorWithRed:47 / 255.0 green:49 / 255.0 blue:50 / 255.0 alpha:1];
    }
    [self addSubview:button];
}

- (BOOL)checkInput:(NSString*)text {
    BOOL allowInput = YES;
    switch (_keyboardType) {
        case EBNumberKeyboardTypeUInteger: {
            if ([text isEqualToString: kEBNumberKeyboardViewDotKey]
                || [text isEqualToString: kEBNumberKeyboardViewMinusKey]) {
                allowInput = NO;
            }
        }
            break;
        case EBNumberKeyboardTypeInteger: {
            if ([text isEqualToString: kEBNumberKeyboardViewDotKey]) {
                allowInput = NO;
            }
        }
            break;
        case EBNumberKeyboardTypeUDecimal: {
            if ([text isEqualToString: kEBNumberKeyboardViewMinusKey]) {
                allowInput = NO;
            }
        }
            break;
        default:
            break;
    }
    return allowInput;
}

- (void)execDelegate:(NSString*)text {
    if ([text isEqualToString:kEBNumberKeyboardViewDoneKey]) {
        if ([self.delegate respondsToSelector:@selector(numberKeyboardViewEndEditing:)]) {
            [self.delegate numberKeyboardViewEndEditing:self];
        }
    }else if ([text isEqualToString:kEBNumberKeyboardViewClearKey]) {
        if ([self.delegate respondsToSelector:@selector(numberKeyboardViewClearText:)]) {
            [self.delegate numberKeyboardViewClearText:self];
        }
    }else if ([text isEqualToString:kEBNumberKeyboardViewDeleteKey]) {
        if ([self.delegate respondsToSelector:@selector(numberKeyboardViewDeleteText:)]) {
            [self.delegate numberKeyboardViewDeleteText:self];
        }
    }else {
        if ([self.delegate respondsToSelector:@selector(numberKeyboardViewEditing:text:)]) {
            [self.delegate numberKeyboardViewEditing:self text:text];
        }
    }
}

@end
