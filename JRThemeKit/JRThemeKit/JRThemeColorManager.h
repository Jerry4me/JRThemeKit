//
//  JRThemeColorManager.h
//  JRFuliApp
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRThemeManager.h"

typedef NSString JRTheme;

#define JRColorPicker(key) [[JRThemeColorManager sharedInstance] pickerWithKey:@#key]
typedef UIColor * (^JRColorPicker)(JRTheme *);

@interface JRThemeColorManager : NSObject

+ (instancetype)sharedInstance;

- (JRColorPicker)pickerWithKey:(NSString *)key;

@end
