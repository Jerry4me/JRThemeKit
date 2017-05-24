//
//  NSObject+jr_theme.h
//  JRFuliApp
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRThemeManager.h"
#import <objc/runtime.h>

@interface NSObject (jr_theme)

/** 主题管理者 */
@property (nonatomic, strong, readonly) JRThemeManager *jr_manager;

/** pickeks */
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, JRColorPicker> *jr_pickers;

@end
