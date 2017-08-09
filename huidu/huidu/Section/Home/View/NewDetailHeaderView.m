//
//  NewDetailHeaderView.m
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/7/31.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "NewDetailHeaderView.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface NewDetailHeaderView ()<UIWebViewDelegate>

@property (nonatomic, strong) UIImageView *avaterImgView;
@property (nonatomic, strong) UILabel *titileLabel;
@property (nonatomic, strong) UIButton *focusButton;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation NewDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
        [self layOut];
    }
    return self;
}

- (void)createSubViews {
    
    self.avaterImgView = [[UIImageView alloc]init];
    self.avaterImgView.layer.cornerRadius = 25;
    self.avaterImgView.layer.masksToBounds = YES;
    [self addSubview:self.avaterImgView];
    self.titileLabel = [[UILabel alloc]init];
    self.titileLabel.numberOfLines = 0;
    [self addSubview:self.titileLabel];
    self.titileLabel.text = @"会说新闻";
    self.focusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.focusButton.backgroundColor = [UIColor colorWithHex:@"#4bb6ac"];
    self.focusButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.focusButton addTarget:self action:@selector(focusButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.focusButton setTitle:@"+ 关注" forState:UIControlStateNormal];
    [self.focusButton setTitle:@"取消关注" forState:UIControlStateSelected];
    [self addSubview:self.focusButton];
//    self.webView = [[UIWebView alloc]init];
//    self.webView.delegate = self;
//    [self addSubview:self.webView];
}

- (void)layOut {
    [self.avaterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(50);
    }];
    [self.titileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avaterImgView.mas_right).offset(10);
        make.right.mas_equalTo(self.focusButton.mas_left).offset(-10);
        make.centerY.mas_equalTo(self);
    }];
    [self.focusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.avaterImgView.mas_bottom).offset(10);
//        make.left.right.mas_equalTo(self);
//        make.height.mas_equalTo(20);
//    }];
}

- (void)focusButtonAction: (UIButton *)button {
    button.selected = !button.selected;

    if (self.focusButtonBlock) {
        self.focusButtonBlock(button.selected);
    }
}

- (void)configureHeaderAvaterWithImage: (NSString *)imageName
                                 title: (NSString *)title {
    [self.avaterImgView sd_setImageWithURL:[NSURL URLWithString:imageName   ]];
    self.titileLabel.text = title;
}

- (void)setModel:(HDNewsDetailModel *)model {
    _model = model;
    [self.webView loadHTMLString:model.content baseURL:nil];
}

//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    // 获取webView的高度
//    CGFloat webViewHeight = [[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
//    NSLog(@"%.f",webViewHeight);
//}

@end
