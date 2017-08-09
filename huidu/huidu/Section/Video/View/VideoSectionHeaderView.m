//
//  VideoSectionHeaderView.m
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "VideoSectionHeaderView.h"
#import <UIImageView+WebCache.h>

@interface VideoSectionHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *avaterImgView;

@property (weak, nonatomic) IBOutlet UILabel *videoTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;

@end

@implementation VideoSectionHeaderView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.avaterImgView.layer.cornerRadius = 15.0f;
    self.avaterImgView.layer.masksToBounds = YES;
}

- (void)configureVideoSectionHeaderViewWithVideoType: (NSString *)videoType playCount: (NSString *)playCount avaterImgName: (NSString *)iconName {

    [self.avaterImgView sd_setImageWithURL:[NSURL URLWithString:iconName]];
    self.videoTypeLabel.text = videoType;
    self.playCountLabel.text = [NSString stringWithFormat:@"%@次点击",playCount];
}

@end
