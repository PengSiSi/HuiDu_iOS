//
//  SpecialListTableViewCell.m
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "SpecialListTableViewCell.h"

@interface SpecialListTableViewCell ()

@property (nonatomic,strong) UIImageView *imgView;//新闻图片
@property (nonatomic,strong) UILabel *nameLable;//新闻栏目名称
@property (nonatomic,strong) UILabel *timeLable;//发布时间
@property (nonatomic,strong) UILabel *titleLable;//新闻标题
@property (nonatomic,strong) UILabel *readLable;//阅读
@property (nonatomic,strong) UILabel *commentLable;//评论

@end

@implementation SpecialListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
        [self layOut];
        [self testUI];
    }
    return self;
}

- (void)createSubViews {
    self.imgView = [[UIImageView alloc]init];
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.imgView];
    self.nameLable = [[UILabel alloc]init];
    [self.contentView addSubview:self.nameLable];
    self.timeLable = [[UILabel alloc]init];
    [self.contentView addSubview:self.timeLable];
    self.titleLable = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleLable];
    self.readLable = [[UILabel alloc]init];
    [self.contentView addSubview:self.readLable];
    self.commentLable = [[UILabel alloc]init];
    [self.contentView addSubview:self.commentLable];
}

- (void)layOut {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(60);
    }];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(10);
        make.top.mas_equalTo(self.imgView);
        make.height.mas_equalTo(20);
    }];
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLable.mas_right).offset(10);
        make.top.mas_equalTo(self.nameLable);
        make.height.mas_equalTo(20);
    }];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(10);
        make.top.mas_equalTo(self.nameLable.mas_bottom).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
    }];
    [self.readLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLable);
        make.top.mas_equalTo(self.titleLable.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.imgView);
    }];
    [self.commentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.readLable.mas_right).offset(10);
        make.top.mas_equalTo(self.titleLable.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.imgView);
    }];
}

- (void)testUI {
    self.imgView.backgroundColor = [UIColor cyanColor];
    self.nameLable.text = @"不惠你看";
    self.timeLable.text = @"发表于2017-4-5";
    self.titleLable.text = @"《了不起的孩子2》谢依霖表演B-box 孟非";
    self.readLable.text = @"3ren阅读";
    self.commentLable.text = @"8人评论";
}

@end
