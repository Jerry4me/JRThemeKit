//
//  UITableView+jr_theme.h
//  夜间模式测试
//
//  Created by sky on 2017/5/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+jr_theme.h"

@interface UITableView (jr_theme)

@property (nonatomic, copy, setter = jr_setSeparatorColorPicker:) JRColorPicker jr_separatorColorPicker;
@property (nonatomic, copy, setter = jr_setSectionIndexColorPicker:) JRColorPicker jr_sectionIndexColorPicker;
@property (nonatomic, copy, setter = jr_setSectionIndexBackgroundColorPicker:) JRColorPicker jr_sectionIndexBackgroundColorPicker;
@property (nonatomic, copy, setter = jr_setSectionIndexTrackingBackgroundColorPicker:) JRColorPicker jr_sectionIndexTrackingBackgroundColorPicker;

@end
