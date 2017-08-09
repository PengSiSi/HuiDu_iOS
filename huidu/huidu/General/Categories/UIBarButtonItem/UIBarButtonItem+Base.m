//
//  UIBarButtonItem+Base.m
//  Ssdfz
//
//  Created by 王楠 on 16/1/20.
//  Copyright © 2016年 Combanc. All rights reserved.
//

#import "UIBarButtonItem+Base.h"

@implementation UIBarButtonItem (Base)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image higlightedImage:(NSString *)higlightedImage target:(id)target action:(SEL)action
{
    // 1.创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 2.设置按钮背景图片
    UIImage *normal = [UIImage imageNamed:image];
    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:higlightedImage] forState:UIControlStateHighlighted];
    
    btn.titleLabel.font = NAV_FONT;
    // 3.设置按钮的尺寸
    btn.bounds = CGRectMake(0, 0, normal.size.width, normal.size.height);
    
    // 4.监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 5.返回创建好的item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithImage:(NSString *)image higlightedImage:(NSString *)higlightedImage title:(NSString *)title target:(id)target action:(SEL)action {
    return [self setItemWithImage:image higlightedImage:higlightedImage title:title titleColor:[UIColor blackColor] font:NAV_FONT target:target action:action];
}

+ (UIBarButtonItem *)itemWithImage:(NSString *)image higlightedImage:(NSString *)higlightedImage title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action {
    return [self setItemWithImage:image higlightedImage:higlightedImage title:title titleColor:color font:NAV_FONT target:target action:action];
}


+ (UIBarButtonItem *)setItemWithImage:(NSString *)image higlightedImage:(NSString *)higlightedImage title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action {
    // 1.创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 2.设置按钮背景图片
    UIImage *normal = [UIImage imageNamed:image];
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:higlightedImage] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(200, 50) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
    
    CGFloat btnWidth = normal.size.width + titleRect.size.width + 20;
    // 3.设置按钮的尺寸
    btn.bounds = CGRectMake(0, 0, btnWidth, 50);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    if ([title isEqualToString:@""]) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    }else {
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    // 4.监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 5.返回创建好的item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
