//
//  UITextField+jr_theme.h
//  夜间模式测试
//
//  Created by sky on 2017/5/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+jr_theme.h"

@interface UITextField (jr_theme)

@property (nonatomic, copy, setter = jr_setTextColorPicker:) JRColorPicker jr_textColorPicker;

@end
