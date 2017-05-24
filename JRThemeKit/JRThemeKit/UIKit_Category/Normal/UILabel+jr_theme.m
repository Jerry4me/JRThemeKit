//
//  UILabel+jr_theme.m
//  夜间模式测试
//
//  Created by sky on 2017/5/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UILabel+jr_theme.h"

@implementation UILabel (jr_theme)

- (JRColorPicker)jr_textColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_textColorPicker));
}

- (void)jr_setTextColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_textColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.textColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setTextColor:))];
}

- (JRColorPicker)jr_shadowColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_shadowColorPicker));
}

- (void)jr_setShadowColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_shadowColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.shadowColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setShadowColor:))];
}

- (JRColorPicker)jr_highlightedTextColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_highlightedTextColorPicker));
}

- (void)jr_setHighlightedTextColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_highlightedTextColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.highlightedTextColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setHighlightedTextColor:))];
}



@end
