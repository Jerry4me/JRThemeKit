//
//  JRThemeImageManager.m
//  夜间模式测试
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "JRThemeImageManager.h"

@implementation JRThemeImageManager

+ (instancetype)sharedInstance
{
    static JRThemeImageManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        
    });
    
    return _instance;
}

- (JRImagePicker)pickerWithKey:(NSString *)key
{
    return ^(JRTheme *theme){
    
        // 根据图片的名称和现在的主题, 拼接出新的图片名称
        NSString *imageName = key;
        NSString *nightName;
        if ([theme isEqualToString:JRThemeNight]) {
            nightName = [imageName stringByAppendingString:@"_night"];
        }
    
        return ([UIImage imageNamed:nightName] != nil) ? [UIImage imageNamed:nightName] : [UIImage imageNamed:imageName];
    };
}

@end
