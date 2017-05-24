//
//  JRBaseNavController.m
//  JRThemeKit
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "JRBaseNavController.h"
#import "JRThemeKit.h"

@interface JRBaseNavController ()

@end

@implementation JRBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar jr_setTitleTextPicker:JRColorPicker(TEXT)];
    self.navigationBar.jr_barTintColorPicker = JRColorPicker(BAR);
    self.navigationBar.jr_tintColorPicker = JRColorPicker(TINT);
    
    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1.0]} forState:UIControlStateNormal];
    
    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    
    // 设置导航栏的主题
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChange) name:JRThemeDidChangeNotification object:nil];
    
}

- (void)themeDidChange
{
    // 设置导航栏barbuttonitem的主题
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];

    if ([[JRThemeManager sharedInstance].theme isEqualToString:JRThemeDay]) {
        [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    } else {
        [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    }
}

@end
