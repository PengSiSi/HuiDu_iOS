//
//  CommentBottomView.m
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/7/31.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "CommentBottomView.h"
#import <Masonry.h>
#import <BAButton.h>
#import "JXButton.h"

@interface CommentBottomView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *inputTextField;
@property (nonatomic, strong) UIView *buttonsView;
@property (nonatomic, strong) JXButton *commentButton;
@property (nonatomic, strong) JXButton *zanButton;
@property (nonatomic, strong) JXButton *likeButton;

@end

@implementation CommentBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHex:@"#D4D8D7"];
        self.userInteractionEnabled = YES;
        [self createSubViews];
        [self layOut];
    }
    return self;
}

- (void)createSubViews {
    
    self.inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, 200, 25)];
    self.inputTextField.delegate = self;
    self.inputTextField.font = [UIFont systemFontOfSize:15];
    self.inputTextField.placeholder = @" 想说点什么?";
    // 设置textField显示图标
    UIView *placeHolderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 30)];
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(5, 7, 15, 15)];
    icon.backgroundColor = [UIColor redColor];
    [placeHolderView addSubview:icon];
    self.inputTextField.leftView = placeHolderView;
    self.inputTextField.leftViewMode = UITextFieldViewModeAlways;
    self.inputTextField.backgroundColor = [UIColor whiteColor];
    [self addSubview:_inputTextField];
    
    self.commentButton = [[JXButton alloc] init];
    self.commentButton.titleLabel.font = [UIFont systemFontOfSize:13];
    self.commentButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.commentButton setTitle:@"20" forState:UIControlStateNormal];
    [self.commentButton setImage:[UIImage imageNamed:@"1x_pinglun"] forState:UIControlStateNormal];
    [self.commentButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.commentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.commentButton.tag = 100;
    [self addSubview:self.commentButton];
    self.zanButton = [[JXButton alloc] init];
    self.zanButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.zanButton setTitle:@"30" forState:UIControlStateNormal];
    [self.zanButton setImage:[UIImage imageNamed:@"1x_fenxiang"] forState:UIControlStateNormal];
    [self.zanButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.zanButton.tag = 101;
    [self addSubview:self.zanButton];
    self.likeButton = [[JXButton alloc] init];
    self.likeButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.likeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

    [self.likeButton setTitle:@"40" forState:UIControlStateNormal];
    [self.likeButton setImage:[UIImage imageNamed:@"1x_zan1"] forState:UIControlStateNormal];
    self.likeButton.tag = 102;
    [self addSubview:self.likeButton];
}

- (void)layOut {
    
    CGFloat space = ([UIScreen mainScreen].bounds.size.width - 220 - 25 * 3) / 4 ;
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.inputTextField.mas_right).offset(space);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(40);
    }];
    [self.zanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.commentButton.mas_right).offset(space);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(40);
    }];
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.zanButton.mas_right).offset(space);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(40);
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (void)buttonClick: (UIButton *)button {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(buttonClick:)]) {
//        [self.delegate buttonDidClick:button];
//    }
    if (self.block) {
        self.block(button.tag, button);
    }
}

@end
