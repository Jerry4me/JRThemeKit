//
//  NSObject+jr_theme.m
//  JRFuliApp
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "NSObject+jr_theme.h"
#import "JRThemeBlockExecutor.h"

const char kDeallocBlockKey;

@implementation NSObject (jr_theme)

- (JRThemeManager *)jr_manager
{
    return [JRThemeManager sharedInstance];
}

- (NSMutableDictionary<NSString *,JRColorPicker> *)jr_pickers
{
    NSMutableDictionary<NSString *,JRColorPicker> *pickers = objc_getAssociatedObject(self, @selector(jr_pickers));
    if(!pickers) { // 如果不存在, 则创建一个
    
        // 在dealloc中需移除监听
        if (objc_getAssociatedObject(self, &kDeallocBlockKey) == nil) {
            
            // __weak在对象销毁的时候会自动置nil, 所以用__unsafe_unretained比较安全
            __unsafe_unretained typeof(self) weakSelf = self;
            JRThemeBlockExecutor *exe = [JRThemeBlockExecutor executorWithBlock:^{
            
                [[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
            }];
            
            objc_setAssociatedObject(self, &kDeallocBlockKey, exe, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
        }
        
        pickers = [[NSMutableDictionary alloc] init];
        // 移除监听的通知
        [[NSNotificationCenter defaultCenter] removeObserver:self name:JRThemeDidChangeNotification object:nil];
        
        // 监听通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jr_updateColor) name:JRThemeDidChangeNotification object:nil];
        
        // 保存起来
        objc_setAssociatedObject(self, @selector(jr_pickers), pickers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    return pickers;
}

- (void)jr_updateColor
{
    // 拿到pickers, 遍历字典, 拿到各种设置颜色的selector和picker, 调用方法
    [self.jr_pickers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selectorString, JRColorPicker  _Nonnull picker, BOOL * _Nonnull stop) {
        
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
        
    }];
    
}


@end
