//
//  UINavigationBar+jr_theme.m
//  夜间模式测试
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UINavigationBar+jr_theme.h"


@implementation UINavigationBar (jr_theme)

- (JRColorPicker)jr_barTintColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_barTintColorPicker));
}

- (void)jr_setBarTintColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_barTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.barTintColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setBarTintColor:))];
}

- (JRColorPicker)jr_tintColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_tintColorPicker));
}

- (void)jr_setTintColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_tintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.tintColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setTintColor:))];
}

- (void)jr_setTitleTextPicker:(JRColorPicker)picker
{
    UIColor *color = picker(self.jr_manager.theme);
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName : color}];
    
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setTitleTextAttributes:))];
    
}

// 重写
- (void)jr_updateColor
{
    // 拿到pickers, 遍历字典, 拿到各种设置颜色的selector和picker, 调用方法
    [self.jr_pickers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selectorString, JRColorPicker  _Nonnull picker, BOOL * _Nonnull stop) {
    
        if ([selectorString isEqualToString:NSStringFromSelector(@selector(setTitleTextAttributes:))]) {
            
            UIColor *color = picker(self.jr_manager.theme);
            [self setTitleTextAttributes:@{NSForegroundColorAttributeName : color}];
        
        } else {
        
            SEL selector = NSSelectorFromString(selectorString);
            UIColor *color = picker(self.jr_manager.theme);
            
            // 利用runtime调用方法
            [UIView animateWithDuration:JRThemeChangeAnimationDuration
                             animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                                 [self performSelector:selector withObject:color];
#pragma clang diagnostic pop
                             }];
        
        }
        
    }];
    
}

@end
