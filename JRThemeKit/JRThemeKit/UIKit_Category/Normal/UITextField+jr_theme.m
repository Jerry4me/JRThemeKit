//
//  UITextField+jr_theme.m
//  夜间模式测试
//
//  Created by sky on 2017/5/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UITextField+jr_theme.h"

@implementation UITextField (jr_theme)

- (JRColorPicker)jr_textColorPicker
{
    return objc_getAssociatedObject(self, @selector(jr_textColorPicker));
}

- (void)jr_setTextColorPicker:(JRColorPicker)picker
{
    objc_setAssociatedObject(self, @selector(jr_textColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.textColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setTextColor:))];
}



@end
