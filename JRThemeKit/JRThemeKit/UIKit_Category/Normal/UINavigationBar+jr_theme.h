//
//  UINavigationBar+jr_theme.h
//  夜间模式测试
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+jr_theme.h"

@interface UINavigationBar (jr_theme)

@property (nonatomic, copy, setter = jr_setBarTintColorPicker:) JRColorPicker jr_barTintColorPicker;
@property (nonatomic, copy, setter = jr_setTintColorPicker:) JRColorPicker jr_tintColorPicker;

- (void)jr_setTitleTextPicker:(JRColorPicker)picker;

@end
