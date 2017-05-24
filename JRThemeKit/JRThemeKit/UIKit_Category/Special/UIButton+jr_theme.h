//
//  UIButton+jr_theme.h
//  夜间模式测试
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+jr_theme.h"

@interface UIButton (jr_theme)

- (void)jr_setTitleColorPicker:(JRColorPicker)picker forState:(UIControlState)state;

- (void)jr_setBackgroundImagePicker:(JRImagePicker)picker forState:(UIControlState)state;

- (void)jr_setImagePicker:(JRImagePicker)picker forState:(UIControlState)state;

@end
