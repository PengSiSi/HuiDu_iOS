//
//  CollectionCell.m
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/7/31.
//  Copyright © 2017年 思 彭. All rights reserved.
// 三张图片的cell

#import "CollectionCell.h"
#import <Masonry.h>
#import "ImageContainerView.h"

@interface CollectionCell ()

@property (nonatomic, strong) UILabel *titleLabel;
//@property (nonatomic, strong) UIView *imagesContainerView;
@property (nonatomic, strong) UILabel *commentTimeLabel;
@property (nonatomic, strong) ImageContainerView *imageContainerView;

@end

@implementation CollectionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
        [self layOut];
        [self testUI];
        // 接收通知
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeCellFrame:) name:@"moveCell" object:nil];
    }
    return self;
}

- (void)changeCellFrame: (NSNotification *)notifi {
    BOOL flag = [notifi.userInfo[@"flag"] boolValue];
    if (flag) {
        [self.selectButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
        }];
    } else {
        [self.selectButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(-20);
        }];
    }
    
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
    
    self.imageContainerView = [[ImageContainerView alloc]init];
    [self.contentView addSubview:self.imageContainerView];
    
    self.commentTimeLabel = [[UILabel alloc]init];
    self.commentTimeLabel.text = @"思思";
    self.commentTimeLabel.font = FONT_15;
    [self.contentView addSubview:self.commentTimeLabel];
    
}

- (void)layOut {
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.height.mas_equalTo(20);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.selectButton.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.top.mas_equalTo(self.contentView).offset(10);
    }];
    [self.imageContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(80);
    }];
    [self.commentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.imageContainerView.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.contentView).offset(-10);
    }];
}

- (void)testUI {
    
    self.commentTimeLabel.text = @"思思 345条评论 08-09 15:33";
    self.imageContainerView.backgroundColor = [UIColor redColor];
    self.titleLabel.text = @"其实Masonry封装的API和苹果官方的思路是非常一致的，如果你经常用storyBoard或者Xib来自动布局的话，上手Masonry应该是很容易的。前段时间看了很多的Masonry的介绍和使用，很多demo都是给定高度.";
}

- (void)selectButtonAction: (UIButton *)button {
    NSLog(@"点击了");
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectButtonDidClick:withButton:)]) {
        [self.delegate selectButtonDidClick:self.indexPath withButton:button];
    }
}

- (void)setModel:(CollectModel *)model {
    self.titleLabel.text = model.title;
    self.commentTimeLabel.text = [NSString stringWithFormat:@"%@ %@",model.comment, model.time];
    self.imageContainerView.imageArray = [@[@"", @"", @""] mutableCopy];
}

//- (void)dealloc {
//    
//    // 移除通知
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}

@end
