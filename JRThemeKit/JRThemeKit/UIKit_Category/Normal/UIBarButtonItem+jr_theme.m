//
//  UIBarButtonItem+jr_theme.m
//  夜间模式测试
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UIBarButtonItem+jr_theme.h"

@implementation UIBarButtonItem (jr_theme)

- (JRColorPicker)jr_tintColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_tintColorPicker));
}

- (void)jr_setTintColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_tintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.tintColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setTintColor:))];
}

@end
