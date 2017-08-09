//
//  VideoFollowCell.m
//  huidu
//
//  Created by 思 彭 on 2017/8/7.
//  Copyright © 2017年 思 彭. All rights reserved.
// 视频详情的关注cell

#import "VideoFollowCell.h"

@interface VideoFollowCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avaterImgView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UIButton *focusButton;
- (IBAction)focusButtonClick:(id)sender;

@end

@implementation VideoFollowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.focusButton.backgroundColor = [UIColor colorWithHex:@"#4bb6ac"];
    self.focusButton.titleLabel.font = FONT_14;
    [self.focusButton setTitle:@" + 关注 " forState:UIControlStateNormal];
    [self.focusButton setTitle:@"取消关注" forState:UIControlStateSelected];
    self.avaterImgView.layer.cornerRadius = 25.0f;
}

- (IBAction)focusButtonClick:(id)sender {
    
}
@end
