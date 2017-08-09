//
//  NSString+StringHeight.m
//  zichan
//
//  Created by 思 彭 on 16/7/15.
//  Copyright © 2016年 Mike. All rights reserved.
//

#import "NSString+StringHeight.h"

#define K_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define K_SCREEN_Height  [UIScreen mainScreen].bounds.size.height

@implementation NSString (StringHeight)


//计算字符串的高度，
-(CGFloat)hightforLable:(NSString *)str font: (UIFont *)font{
    
    CGFloat height = [str boundingRectWithSize:
                      CGSizeMake(K_SCREEN_WIDTH - 20, CGFLOAT_MAX)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                    attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil].size.height + 5;
    
    return height;
}

@end
