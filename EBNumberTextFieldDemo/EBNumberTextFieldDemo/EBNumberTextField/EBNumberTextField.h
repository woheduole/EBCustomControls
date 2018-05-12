//
//  EBNumberTextField.h
//  eBest_KA_Pro
//
//  Created by HoYo on 2018/5/8.
//  Copyright © 2018年 com.ebest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EBNumberKeyboardView.h"

@interface EBNumberTextField : UITextField
@property (nonatomic, assign) EBNumberKeyboardType numberKeyboardType;
@property (nonatomic, assign) NSInteger maxLength;
@end
