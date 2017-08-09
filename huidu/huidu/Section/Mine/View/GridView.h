//
//  GridView.h
//  huidu
//
//  Created by 思 彭 on 2017/8/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridView : UIView

- (instancetype)initWithFrame: (CGRect)frame titleArray: (NSArray *)titleArray subTitleArray: (NSArray *)subTitleArray;

@property (nonatomic, strong) UIColor *titleTextColor;
@property (nonatomic, strong) UIColor *subTitleTextColor;
@property (nonatomic, strong) UIFont *titleTextFont;
@property (nonatomic, strong) UIFont *subTitleTextFont;

@end
