//
//  VideoInfoCell.m
//  huidu
//
//  Created by 思 彭 on 2017/8/7.
//  Copyright © 2017年 思 彭. All rights reserved.

// 视频详情的视频信息cell

#import "VideoInfoCell.h"

@interface VideoInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;
@property (weak, nonatomic) IBOutlet UIButton *noZanButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *zanLabel;
@property (weak, nonatomic) IBOutlet UILabel *noZanLabel;

@end

@implementation VideoInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.zanButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
}


@end
