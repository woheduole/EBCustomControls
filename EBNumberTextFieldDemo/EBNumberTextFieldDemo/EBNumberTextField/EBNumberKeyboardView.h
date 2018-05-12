//
//  EBNumberKeyboardView.h
//  eBest_KA_Pro
//
//  Created by HoYo on 2018/5/8.
//  Copyright © 2018年 com.ebest. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EBNumberKeyboardType) {
    EBNumberKeyboardTypeDefault, // 系统默认键盘
    EBNumberKeyboardTypeUInteger, // 无符号整数
    EBNumberKeyboardTypeInteger, // 有符号整数
    EBNumberKeyboardTypeUDecimal, // 无符号小数
    EBNumberKeyboardTypeDecimal // 有符号小数
};


extern NSString *const kEBNumberKeyboardViewMinusKey;
extern NSString *const kEBNumberKeyboardViewDotKey;

@protocol EBNumberKeyboardViewDelegate;
@interface EBNumberKeyboardView : UIView
@property (nonatomic, assign) EBNumberKeyboardType keyboardType;
@property (nonatomic, weak) id <EBNumberKeyboardViewDelegate> delegate;
- (instancetype)initWithKeyboardType:(EBNumberKeyboardType)keyboardType;
@end


@protocol EBNumberKeyboardViewDelegate <NSObject>
@optional
// 输入数字、小数点、负号
- (void)numberKeyboardViewEditing:(EBNumberKeyboardView *)keyboardView text:(NSString*)text;
// 点击完成输入
- (void)numberKeyboardViewEndEditing:(EBNumberKeyboardView *)keyboardView;
// 删除字符
- (void)numberKeyboardViewDeleteText:(EBNumberKeyboardView *)keyboardView;
// 清空文本
- (void)numberKeyboardViewClearText:(EBNumberKeyboardView *)keyboardView;
@end
