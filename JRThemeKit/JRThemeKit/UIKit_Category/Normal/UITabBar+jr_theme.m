//
//  UITabBar+jr_theme.m
//  夜间模式测试
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UITabBar+jr_theme.h"

@implementation UITabBar (jr_theme)

- (JRColorPicker)jr_barTintColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_barTintColorPicker));
}

- (void)jr_setBarTintColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_barTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.barTintColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setBarTintColor:))];
}



@end
