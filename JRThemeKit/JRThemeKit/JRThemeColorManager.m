//
//  JRThemeColorManager.m
//  JRFuliApp
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "JRThemeColorManager.h"

@interface JRThemeColorManager()

/** 存放颜色表的字典 */
@property (nonatomic, strong) NSDictionary<NSString *, NSDictionary<NSString *, UIColor *> *> *colorsDict;

@end

@implementation JRThemeColorManager

- (NSDictionary *)colorsDict
{
    if(!_colorsDict) {

        // 先无视色表的内容
        _colorsDict = @{
            JRThemeDay : @{
                @"BG" : [UIColor whiteColor],
                @"CELLBG" : [UIColor whiteColor],
                @"TVBG" : [UIColor colorWithRed:238/255.0 green:235/255.0 blue:235/255.0 alpha:1.0],
                @"SEP" : [UIColor colorWithRed:239/255.0 green:239/255.0 blue:238/255.0 alpha:1.0],
                @"TINT" : [UIColor blackColor],
                @"TEXT" : [UIColor blackColor],
                @"BAR" : [UIColor whiteColor],
                @"HIGHLIGHTED" : [UIColor blueColor]
            },
            JRThemeNight : @{
                @"BG" : [UIColor colorWithRed:48/255.0 green:48/255.0 blue:48/255.0 alpha:1.0],
                @"CELLBG" : [UIColor colorWithRed:48/255.0 green:48/255.0 blue:48/255.0 alpha:1.0],
                @"TVBG" : [UIColor colorWithRed:36/255.0 green:36/255.0 blue:36/255.0 alpha:1.0],
                @"SEP" : [UIColor colorWithRed:36/255.0 green:36/255.0 blue:36/255.0 alpha:1.0],
                @"TINT" : [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0],
                @"TEXT" : [UIColor whiteColor],
                @"BAR" : [UIColor colorWithRed:48/255.0 green:48/255.0 blue:48/255.0 alpha:1.0],
                @"HIGHLIGHTED" : [UIColor redColor]
            }
        };
        
    }
    
    return _colorsDict;
}

+ (instancetype)sharedInstance
{
    static JRThemeColorManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        
    });
    
    return _instance;
}

- (JRColorPicker)pickerWithKey:(NSString *)key
{
    return ^(JRTheme *theme) {
        // 根据色表返回对应的颜色
        return self.colorsDict[theme][key];
    };
}

@end
