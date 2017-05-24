//
//  JRBaseTabBarController.m
//  JRThemeKit
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "JRBaseTabBarController.h"
#import "JRThemeKit.h"

@interface JRBaseTabBarController ()

@end

@implementation JRBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.jr_barTintColorPicker = JRColorPicker(BAR);
    
}

@end
