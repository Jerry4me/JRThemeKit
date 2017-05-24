//
//  JRThemeBlockExecutor.m
//  夜间模式测试
//
//  Created by sky on 2017/5/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "JRThemeBlockExecutor.h"

@implementation JRThemeBlockExecutor

+ (instancetype)executorWithBlock:(void (^)())block
{
    JRThemeBlockExecutor *exe = [[JRThemeBlockExecutor alloc] init];
    
    exe.block = block;
    
    return exe;
}

- (void)dealloc
{

    if (self.block) {
        self.block();
        self.block = nil;
    }
}

@end
