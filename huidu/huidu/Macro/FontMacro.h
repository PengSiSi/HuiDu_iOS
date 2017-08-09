//
//  FontMacro.h
//  Ssdfz
//
//  Created by 王楠 on 16/1/19.
//  Copyright © 2016年 Combanc. All rights reserved.
//  字体宏

#ifndef FontMacro_h
#define FontMacro_h

///圆角弧度
#define CORNER_RADIUS 5.0f
///标签线条宽度
#define BORDER_WIDTH 1.0f

///导航条按钮字体大小
#define NAV_FONT [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:18] : [UIFont fontWithName:@"PingFang SC" size:13]
/**
 *  字体一共有五种字号，自己需要那种使用哪种
 */
#define FONT_23 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:23] : [UIFont fontWithName:@"PingFang SC" size:22]

#define FONT_20 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:20] : [UIFont fontWithName:@"PingFang SC" size:19]

#define FONT_18 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:18] : [UIFont fontWithName:@"PingFang SC" size:17]

#define FONT_17 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:17] : [UIFont fontWithName:@"PingFang SC" size:16]

#define FONT_16 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:16] : [UIFont fontWithName:@"PingFang SC" size:15]

#define FONT_15 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:15] : [UIFont fontWithName:@"PingFang SC" size:14]

#define FONT_14 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:14] : [UIFont fontWithName:@"PingFang SC" size:13]

#define FONT_13 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:13] : [UIFont fontWithName:@"PingFang SC" size:13]

#define FONT_12 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:12] : [UIFont fontWithName:@"PingFang SC" size:12]

#define FONT_11 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:11] : [UIFont fontWithName:@"PingFang SC" size:11]

#define FONT_10 [UIScreen mainScreen].bounds.size.width > 320 ? [UIFont fontWithName:@"PingFang SC" size:10] : [UIFont fontWithName:@"PingFang SC" size:10]

#endif /* FontMacro_h */
