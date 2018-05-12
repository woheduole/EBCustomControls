//
//  EBCountDownButton.h
//  eBest_KA_Pro
//
//  Created by HoYo on 2018/4/24.
//  Copyright © 2018年 com.ebest. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^EBCountDownButtonBlock)(BOOL finished);

@interface EBCountDownButton : UIButton
- (void)countDownWithDuration:(NSTimeInterval)duration completion:(EBCountDownButtonBlock)completion;
@end
