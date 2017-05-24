//
//  UIView+jr_theme.m
//  JRFuliApp
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UIView+jr_theme.h"

@implementation UIView (jr_theme)

- (JRColorPicker)jr_backgroundColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_backgroundColorPicker));
}

- (void)jr_setBackgroundColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_backgroundColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.backgroundColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setBackgroundColor:))];
}

- (JRColorPicker)jr_tintColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_tintColorPicker));
}

- (void)jr_setTintColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_tintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.tintColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setTintColor:))];
}

@end
