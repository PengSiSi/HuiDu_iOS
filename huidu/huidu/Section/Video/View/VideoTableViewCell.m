//
//  VideoTableViewCell.m
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "VideoTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface VideoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation VideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureVideoTableViewCellWithImgName: (NSString *)imageName title: (NSString *)title {
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imageName]];
    self.titleLabel.text = title;
}

@end
