//
//  JRThemeImageManager.h
//  夜间模式测试
//
//  Created by sky on 2017/5/19.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRThemeManager.h"

typedef NSString JRTheme;

#define JRImagePicker(key) [[JRThemeImageManager sharedInstance] pickerWithKey:key]
typedef UIImage * (^JRImagePicker)(JRTheme *);

@interface JRThemeImageManager : NSObject

+ (instancetype)sharedInstance;


/**
 返回imagePicker

 @param key 图片的名称
 */
- (JRImagePicker)pickerWithKey:(NSString *)key;

@end
