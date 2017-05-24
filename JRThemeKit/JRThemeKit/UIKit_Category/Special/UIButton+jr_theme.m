//
//  UIButton+jr_theme.m
//  夜间模式测试
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UIButton+jr_theme.h"

@interface UIButton()

/** pickeks */
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, id> *jr_pickers;

@end

@implementation UIButton (jr_theme)

- (void)jr_setTitleColorPicker:(JRColorPicker)picker forState:(UIControlState)state
{
    // 调用系统API设置对应状态的颜色
    [self setTitleColor:picker(self.jr_manager.theme) forState:state];
    
    NSString *key = [NSString stringWithFormat:@"%@", @(state)];
    
    NSMutableDictionary *dict = [self.jr_pickers valueForKey:key];
        if(!dict) {
        dict = [[NSMutableDictionary alloc] init];
    }
    
    [dict setValue:picker forKey:NSStringFromSelector(@selector(setTitleColor:forState:))];
    [self.jr_pickers setValue:dict forKey:key];
    
}

- (void)jr_setImagePicker:(JRImagePicker)picker forState:(UIControlState)state
{
    // 调用系统API设置对应状态的颜色
    [self setImage:picker(self.jr_manager.theme) forState:state];
    
    NSString *key = [NSString stringWithFormat:@"%@", @(state)];
    
    NSMutableDictionary *dict = [self.jr_pickers valueForKey:key];
        if(!dict) {
        dict = [[NSMutableDictionary alloc] init];
    }
    
    [dict setValue:picker forKey:NSStringFromSelector(@selector(setImage:forState:))];
    [self.jr_pickers setValue:dict forKey:key];
}

- (void)jr_setBackgroundImagePicker:(JRImagePicker)picker forState:(UIControlState)state
{
    // 调用系统API设置对应状态的颜色
    [self setBackgroundImage:picker(self.jr_manager.theme) forState:state];
    
    NSString *key = [NSString stringWithFormat:@"%@", @(state)];
    
    NSMutableDictionary *dict = [self.jr_pickers valueForKey:key];
        if(!dict) {
        dict = [[NSMutableDictionary alloc] init];
    }
    
    [dict setValue:picker forKey:NSStringFromSelector(@selector(setBackgroundImage:forState:))];
    [self.jr_pickers setValue:dict forKey:key];
}

/**
 * 重写该方法, 分别处理
 * picker为colorPicker和imagePicker
 * setter方法参数为1还是为2的情况, 如setBackgroundColor和setImage:forState ...
 *
 */
- (void)jr_updateColor
{
    // 拿到pickers, 遍历字典, 拿到各种设置颜色的selector和picker, 调用方法
    [self.jr_pickers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if([obj isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary<NSString *, JRColorPicker> *dictionary = obj;
            
            // 拿到状态, 例如Normal, Selected, Highlighted ...
            UIControlState state = [key integerValue];
            
            [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selectorString, JRColorPicker  _Nonnull picker, BOOL * _Nonnull stop) {
                
                [UIView animateWithDuration:JRThemeChangeAnimationDuration animations:^{
                    // 判断是什么方法
                    if([selectorString isEqualToString:NSStringFromSelector(@selector(setTitleColor:forState:))]) { // 设置文本颜色
                        UIColor *color = picker(self.jr_manager.theme);
                        [self setTitleColor:color forState:state];
                        
                    } else if ([selectorString isEqualToString:NSStringFromSelector(@selector(setImage:forState:))]) { // 设置图片
                        UIImage *image = ((JRImagePicker)picker)(self.jr_manager.theme);
                        [self setImage:image forState:state];
                    
                    } else if ([selectorString isEqualToString:NSStringFromSelector(@selector(setBackgroundImage:forState:))]) { // 设置背景图片
                        UIImage *image = ((JRImagePicker)picker)(self.jr_manager.theme);
                        [self setBackgroundImage:image forState:state];
                        
                    }
                    
                }];
            }];
            
        } else {
            SEL selector = NSSelectorFromString(key);
            JRColorPicker picker = (JRColorPicker)obj;
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
