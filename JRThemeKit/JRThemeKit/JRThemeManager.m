//
//  JRThemeManager.m
//  JRFuliApp
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "JRThemeManager.h"

NSString * const JRThemeDay = @"DAY"; // 日间模式
NSString * const JRThemeNight = @"NIGHT"; // 夜间模式

NSString * const JRThemeDidChangeNotification = @"JRThemeDidChangeNotification"; // 主题改变的通知

NSString * const kThemeKey = @"kThemeKey";

CGFloat const JRThemeChangeAnimationDuration = 0.3; // 主题修改的动画时间

@implementation JRThemeManager

+ (void)load
{
    [self sharedInstance];
}

+ (instancetype)sharedInstance
{
    static JRThemeManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        
        // 默认修改状态栏样式
        _instance.shouldChangeStatusStyle = YES;
        
        // 读取偏好设置, 如果用户没有设置过, 则默认为日间模式
        _instance.theme = ([[NSUserDefaults standardUserDefaults] valueForKey:kThemeKey] ? [[NSUserDefaults standardUserDefaults] valueForKey:kThemeKey] : JRThemeDay);
        
    });
    
    return _instance;
}

- (void)setTheme:(JRTheme *)theme
{

    if([_theme isEqualToString:theme]) { // 如果主题没有改变, 则不做任何处理
        return ;
    }

    _theme = theme;
    
    // 将主题保存到偏好设置中
    [[NSUserDefaults standardUserDefaults] setValue:theme forKey:kThemeKey];
    
    // 立即同步
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // 发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:JRThemeDidChangeNotification object:nil];
    
    // 修改状态栏样式
    if (self.shouldChangeStatusStyle) {
        if ([self.theme isEqualToString:JRThemeNight]) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        } else {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        }
    }
    
}

- (void)change2day
{
    self.theme = JRThemeDay;
    
}

- (void)change2night
{
    self.theme = JRThemeNight;
}

@end
