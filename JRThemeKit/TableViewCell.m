//
//  TableViewCell.m
//  JRThemeKit
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "TableViewCell.h"
#import "JRThemeKit.h"

@interface TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end

@implementation TableViewCell

+ (instancetype)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.jr_backgroundColorPicker = JRColorPicker(CELLBG);
    self.label.jr_textColorPicker = JRColorPicker(TEXT);
    self.iv.jr_imagePicker = JRImagePicker(@"icon");
    
}

@end
