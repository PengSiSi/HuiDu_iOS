//
//  NewDetailHeaderView.h
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/7/31.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDNewsDetailModel.h";

typedef void(^FocusButtonBlock)(BOOL flag);

@interface NewDetailHeaderView : UIView

- (void)configureHeaderAvaterWithImage: (NSString *)imageName
                                 title: (NSString *)title;

@property (nonatomic, copy) FocusButtonBlock focusButtonBlock; // 关注的block
@property (nonatomic, strong) HDNewsDetailModel *model;

@end
