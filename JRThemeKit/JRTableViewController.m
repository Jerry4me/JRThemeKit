//
//  JRTableViewController.m
//  JRThemeKit
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "JRTableViewController.h"
#import "JRThemeKit.h"
#import "TableViewCell.h"

@interface JRTableViewController ()

@end

@implementation JRTableViewController

static NSString *_identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.jr_backgroundColorPicker = JRColorPicker(BG);
    self.tableView.jr_backgroundColorPicker = JRColorPicker(BG);
    
    UISwitch *btn = [[UISwitch alloc] init];
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:_identifier];
    
}

- (void)btnOnClick:(UISwitch *)sender
{
    if (sender.isOn) {
        [JRThemeManager sharedInstance].theme = JRThemeNight;
    } else {
        [JRThemeManager sharedInstance].theme = JRThemeDay;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TableViewCell *cell = [TableViewCell cell];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
