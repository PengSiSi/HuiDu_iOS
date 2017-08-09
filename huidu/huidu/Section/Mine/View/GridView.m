//
//  GridView.m
//  huidu
//
//  Created by 思 彭 on 2017/8/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "GridView.h"

//#define itemWidth (;
//#define itemHeight  self.height;

@interface GridView ()

@property (nonatomic, weak) UILabel *titileLabel;
@property (nonatomic, weak) UILabel *subTitleLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *subTitleArray;

@end

@implementation GridView

- (instancetype)initWithFrame: (CGRect)frame titleArray: (NSArray *)titleArray subTitleArray: (NSArray *)subTitleArray {
    if (self = [super initWithFrame:frame]) {
        self.titleArray = titleArray;
        self.subTitleArray = subTitleArray;
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
   
    for (NSInteger i = 0; i < self.titleArray.count; i++) {
        UIView *itemView = [self createItemWithX:i * (self.width / 4 ) Title:self.titleArray[i] subTitle:self.subTitleArray[i] hasLineView: (i != self.titleArray.count - 1) ? YES : NO] ;
        [self addSubview:itemView];
    }
}

- (UIView *)createItemWithX: (CGFloat)x Title: (NSString *)title subTitle: (NSString *)subTitle hasLineView: (BOOL)hasLineView {
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(x, 0, self.width / 4, 70)];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.width / 4  -1, 20)];
    titleLabel.textAlignment  =NSTextAlignmentCenter;
    titleLabel.text = title;
    self.titileLabel = titleLabel;
    titleLabel.textColor = [UIColor lightGrayColor];
    [containerView addSubview:titleLabel];
    UILabel *subTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, titleLabel.bottom + 10, self.width / 4 - 1, 20)];
    subTitleLabel.text = subTitle;
    subTitleLabel.textAlignment  =NSTextAlignmentCenter;
    self.subTitleLabel = subTitleLabel;
    subTitleLabel.textColor = MAIN_COLOR;
//    subTitleLabel.font = self.subTitleTextFont;
    [containerView addSubview:subTitleLabel];
    if (hasLineView) {        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(self.width / 4 - 1, 0, 1, self.height)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [containerView addSubview:lineView];
    }
    return containerView;
}

- (void)setTitleTextColor:(UIColor *)titleTextColor {
    self.subTitleLabel.textColor = titleTextColor;
}

@end
