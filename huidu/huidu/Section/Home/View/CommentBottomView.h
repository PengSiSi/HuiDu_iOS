//
//  CommentBottomView.h
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/7/31.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonDidClickBlock)(NSInteger tag, UIButton *button);

// 本来打算用代理实现,但是不响应,改用block实现即可

@protocol CommentBottomViewDelegate <NSObject>

- (void)buttonDidClick: (UIButton *)button;
//- (void)zanButtonDidClick: (UIButton *)button;
//- (void)shareButtonDidClick: (UIButton *)button;

@end

@interface CommentBottomView : UIView

@property (nonatomic, assign) id<CommentBottomViewDelegate>delegate;
@property (nonatomic, copy) ButtonDidClickBlock block;

@end
