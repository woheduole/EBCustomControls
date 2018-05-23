//
//  EBNumberTextField.m
//  eBest_KA_Pro
//
//  Created by HoYo on 2018/5/8.
//  Copyright © 2018年 com.ebest. All rights reserved.
//

#import "EBNumberTextField.h"

@interface EBNumberTextField()<EBNumberKeyboardViewDelegate>
@property (nonatomic, weak) EBNumberKeyboardView *numberKeyboardView;
@end

@implementation EBNumberTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _maxLength = 0;
        EBNumberKeyboardView *numberKeyboardView = [[EBNumberKeyboardView alloc] initWithKeyboardType:EBNumberKeyboardTypeDecimal];
        numberKeyboardView.delegate = self;
        self.inputView = numberKeyboardView;
        /*
         1.当使用第三方键盘管理类IQKeyboardManager，禁用toolBar
         2.如果没有用到第三方键盘管理可以不加这行代码
         3.可以把[UIView new]替换成一个自定义的视图来实现IQKeyboardManager的toolbar功能
         */
        self.inputAccessoryView = [UIView new];
        _numberKeyboardView = numberKeyboardView;
    }
    return self;
}

#pragma mark - Methods
- (NSRange)selectedRange {
    NSInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:self.selectedTextRange.start];
    NSInteger length = [self offsetFromPosition:self.selectedTextRange.start toPosition:self.selectedTextRange.end];
    NSRange range = NSMakeRange(location, length);
    return range;
}


#pragma mark - Setter
- (void)setNumberKeyboardType:(EBNumberKeyboardType)numberKeyboardType {
    _numberKeyboardView.keyboardType = numberKeyboardType;
    if (numberKeyboardType == EBNumberKeyboardTypeDefault) {
        self.inputView = nil;
        self.inputAccessoryView = nil;
    }
}
#pragma mark - EBNumberKeyboardViewDelegate
// 输入数字、小数点、负号
- (void)numberKeyboardViewEditing:(EBNumberKeyboardView *)keyboardView text:(NSString*)text {
    if ([text isEqualToString:kEBNumberKeyboardViewDotKey]) {
        // 小数点不能在第一位并且只能有一个小数点
        if (self.text.length == 0
            || [self.text rangeOfString:kEBNumberKeyboardViewDotKey].location != NSNotFound) {
            return;
        }
    }else if([text isEqualToString:kEBNumberKeyboardViewMinusKey]) {
        // 负号只能在第一位
        if (self.text.length > 0) {
            return;
        }
    }
    NSString *fullText = [self.text stringByAppendingString:text];
    if (_maxLength >0 && fullText.length > _maxLength) {
        return;
    }
    if([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        NSRange range = [self selectedRange];
        BOOL changed = [self.delegate textField:self shouldChangeCharactersInRange:range replacementString:text];
        if (changed) {
            [self insertText:text];
        }
    }else {
        [self insertText:text];
    }
}
// 点击完成输入
- (void)numberKeyboardViewEndEditing:(EBNumberKeyboardView *)keyboardView {
    [self resignFirstResponder];
}
// 删除字符
- (void)numberKeyboardViewDeleteText:(EBNumberKeyboardView *)keyboardView {
    [self deleteBackward];
}
// 清空文本
- (void)numberKeyboardViewClearText:(EBNumberKeyboardView *)keyboardView {
    self.text = @"";
}
@end
