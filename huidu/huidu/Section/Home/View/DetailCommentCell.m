//
//  DetailCommentCell.m
//  huidu
//
//  Created by 思 彭 on 2017/8/7.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "DetailCommentCell.h"
#import <UIImageView+WebCache.h>

@implementation DetailCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.avaterImgView.layer.cornerRadius = 25.0f;
    self.avaterImgView.layer.masksToBounds = YES;
}

- (IBAction)zanDidClick:(id)sender {
    NSLog(@"点赞");
}

- (void)setModel:(NewDetailCommentModel *)model {
    
    _model = model;
    [self.avaterImgView sd_setImageWithURL:[NSURL URLWithString:model.headimgurl]];
    self.nickNamelabel.text = model.nickname;
    self.timeLabel.text = model.add_time;
}

@end
