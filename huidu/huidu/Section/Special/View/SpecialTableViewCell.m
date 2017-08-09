//
//  SpecialTableViewCell.m
//  huidu
//
//  Created by 思 彭 on 2017/8/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "SpecialTableViewCell.h"

@interface SpecialTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation SpecialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureBgViewWithImageName: (NSString *)imageName title: (NSString *)title sunTitle: (NSString *)subTitle {
    
    self.bgImgView.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = title;
    self.subTitleLabel.text = subTitle;
}

@end
