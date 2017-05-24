//
//  UITableView+jr_theme.m
//  夜间模式测试
//
//  Created by sky on 2017/5/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UITableView+jr_theme.h"

@implementation UITableView (jr_theme)

- (JRColorPicker)jr_separatorColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_separatorColorPicker));
}

- (void)jr_setSeparatorColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_separatorColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.separatorColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setSeparatorColor:))];
}

- (JRColorPicker)jr_sectionIndexColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_sectionIndexColorPicker));
}

- (void)jr_setSectionIndexColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_sectionIndexColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.sectionIndexColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setSectionIndexColor:))];
}

- (JRColorPicker)jr_sectionIndexBackgroundColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_sectionIndexBackgroundColorPicker));
}

- (void)jr_setSectionIndexBackgroundColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_sectionIndexBackgroundColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.sectionIndexBackgroundColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setSectionIndexBackgroundColor:))];
}

- (JRColorPicker)jr_sectionIndexTrackingBackgroundColorPicker {
    return objc_getAssociatedObject(self, @selector(jr_sectionIndexTrackingBackgroundColorPicker));
}

- (void)jr_setSectionIndexTrackingBackgroundColorPicker:(JRColorPicker)picker {
    objc_setAssociatedObject(self, @selector(jr_sectionIndexTrackingBackgroundColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.sectionIndexTrackingBackgroundColor = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setSectionIndexTrackingBackgroundColor:))];
}

@end
