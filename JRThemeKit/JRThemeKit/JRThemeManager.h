//
//  JRThemeManager.h
//  JRFuliApp
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRThemeColorManager.h"
#import "JRThemeImageManager.h"

typedef NSString JRTheme;

extern NSString * const JRThemeDay; // 日间模式
extern NSString * const JRThemeNight; // 夜间模式

/** 主题改变的通知 */
extern NSString * const JRThemeDidChangeNotification;
/** 主题修改的动画时间 */
extern CGFloat const JRThemeChangeAnimationDuration;

@interface JRThemeManager : NSObject

/** 当前主题 */
@property (nonatomic, copy) JRTheme *theme;

/** 修改状态栏样式 */
@property (nonatomic, assign) BOOL shouldChangeStatusStyle;

+ (instancetype)sharedInstance;

/**
 * 切换到日间模式
 */
- (void)change2day;

/**
 * 切换到夜间模式
 */
- (void)change2night;


@end
