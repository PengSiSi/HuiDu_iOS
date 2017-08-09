//
//  MineLoginHeaderView.m
//  huidu
//
//  Created by 思 彭 on 2017/8/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MineLoginHeaderView.h"
#import "GridView.h"

@interface MineLoginHeaderView ()

@property (nonatomic, strong) UIImageView *avaterImgView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *personalSignatureLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) GridView *grideView;

@end

@implementation MineLoginHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubViews];
        [self layOut];
        [self testUI];
    }
    return self;
}

- (void)createSubViews {
    self.avaterImgView = [[UIImageView alloc]init];
    [self addSubview:self.avaterImgView];
    self.avaterImgView.layer.cornerRadius = 25;
    self.avaterImgView.layer.masksToBounds = YES;
    self.nickNameLabel = [[UILabel alloc]init];
    [self addSubview:self.nickNameLabel];
    self.personalSignatureLabel = [[UILabel alloc]init];
    [self addSubview:self.personalSignatureLabel];
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView];
    
    self.grideView = [[GridView alloc]initWithFrame:CGRectMake(0, 80, K_SCREEN_WIDTH, 80) titleArray:@[@"排名", @"粉丝", @"分享次数", @"阅读量"] subTitleArray:@[@"111", @"222",@"@333", @"444"]];
    self.grideView.subTitleTextColor = MAIN_COLOR;
    self.grideView.subTitleTextFont = FONT_16;
    [self addSubview:self.grideView];
}

- (void)layOut {
    [self.avaterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(10);
        make.width.height.mas_equalTo(50);
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avaterImgView.mas_right).offset(10);
        make.top.mas_equalTo(self.avaterImgView);
    }];
    [self.personalSignatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickNameLabel);
        make.top.mas_equalTo(self.nickNameLabel.mas_bottom).offset(10);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.avaterImgView.mas_bottom).offset(20);
    }];
//    [self.grideView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(60);
//        make.width.mas_equalTo(K_SCREEN_WIDTH);
//        make.top.mas_equalTo(self.lineView.mas_bottom).offset(20);
//    }];
}

- (void)testUI {
    self.avaterImgView.backgroundColor = [UIColor redColor];
    self.nickNameLabel.text = @"思思";
    self.personalSignatureLabel.text = @"个性签名";
//    self.grideView.backgroundColor = [UIColor redColor];
}

@end
