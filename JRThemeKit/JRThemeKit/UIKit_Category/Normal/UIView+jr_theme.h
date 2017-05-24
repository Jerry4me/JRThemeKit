//
//  UIView+jr_theme.h
//  JRFuliApp
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+jr_theme.h"

@interface UIView (jr_theme)

@property (nonatomic, copy, setter = jr_setBackgroundColorPicker:) JRColorPicker jr_backgroundColorPicker;
@property (nonatomic, copy, setter = jr_setTintColorPicker:) JRColorPicker jr_tintColorPicker;

@end
