//
//  UILabel+jr_theme.h
//  夜间模式测试
//
//  Created by sky on 2017/5/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+jr_theme.h"

@interface UILabel (jr_theme)

@property (nonatomic, copy, setter = jr_setTextColorPicker:) JRColorPicker jr_textColorPicker;
@property (nonatomic, copy, setter = jr_setShadowColorPicker:) JRColorPicker jr_shadowColorPicker;
@property (nonatomic, copy, setter = jr_setHighlightedTextColorPicker:) JRColorPicker jr_highlightedTextColorPicker;

@end
