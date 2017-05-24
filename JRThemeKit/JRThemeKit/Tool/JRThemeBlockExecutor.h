//
//  JRThemeBlockExecutor.h
//  夜间模式测试
//
//  Created by sky on 2017/5/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRThemeBlockExecutor : NSObject

/** block */
@property (nonatomic, copy) void (^block)();

+ (instancetype)executorWithBlock:(void (^)())block;

@end
