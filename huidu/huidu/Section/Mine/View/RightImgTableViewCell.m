//
//  RightImgTableViewCell.m
//  huidu
//
//  Created by 思 彭 on 2017/8/6.
//  Copyright © 2017年 思 彭. All rights reserved.
// 右边图片的cell

#import "RightImgTableViewCell.h"

@interface RightImgTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *commentTimeLabel;
@property (nonatomic, strong) UIImageView *rightImgView;

@end

@implementation RightImgTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
        [self layOut];
        [self testUI];
    }
    return self;
}

- (void)createSubViews {

    self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectButton setImage:[UIImage imageNamed:@"radio_choice"] forState:UIControlStateNormal];
    [self.selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.selectButton];

    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.text = @"思思";
    self.titleLabel.font = FONT_15;
    [self.contentView addSubview:self.titleLabel];

    self.commentTimeLabel = [[UILabel alloc]init];
    self.commentTimeLabel.text = @"思思";
    self.commentTimeLabel.font = FONT_15;
    [self.contentView addSubview:self.commentTimeLabel];
    self.rightImgView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.rightImgView];
}

- (void)selectButtonAction: (UIButton *)button {
    NSLog(@"点击了");
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectButtonDidClick:withButton:)]) {
        [self.delegate selectButtonDidClick:self.indexPath withButton:button];
    }
}

- (void)layOut {

    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.height.mas_equalTo(20);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.selectButton.mas_right).offset(10);
        make.top.mas_equalTo(self.contentView).offset(10);
        make.width.mas_equalTo((K_SCREEN_WIDTH - 40) * 0.7);
    }];
    [self.commentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.contentView).offset(-10);
    }];
    [self.rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(10);
        make.top.mas_equalTo(self.titleLabel);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.bottom.mas_equalTo(self.commentTimeLabel);
    }];
}

- (void)testUI {
    
    self.commentTimeLabel.text = @"思思 345条评论 08-09 15:33";
    self.rightImgView.backgroundColor = [UIColor redColor];
    self.titleLabel.text = @"其实Masonry封装的API和苹果官方的思路是非常一致的，如果你经常用storyBoard或者Xib.";
}

@end
