//
//  UIImageView+jr_theme.m
//  夜间模式测试
//
//  Created by sky on 2017/5/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UIImageView+jr_theme.h"

@implementation UIImageView (jr_theme)

- (instancetype)jr_initWithImagePicker:(JRImagePicker)picker
{
    UIImageView *iv = [self initWithImage:picker(self.jr_manager.theme)];
    
    iv.jr_imagePicker = [picker copy];
    return iv;
}

- (JRImagePicker)jr_imagePicker
{
    return objc_getAssociatedObject(self, @selector(jr_imagePicker));
}


- (void)jr_setImagePicker:(JRImagePicker)picker
{
    objc_setAssociatedObject(self, @selector(jr_imagePicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = picker(self.jr_manager.theme);
    [self.jr_pickers setValue:[picker copy] forKey:NSStringFromSelector(@selector(setImage:))];
    
}

@end
