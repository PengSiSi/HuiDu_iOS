//
//  DetailCommentCell.h
//  huidu
//
//  Created by 思 彭 on 2017/8/7.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewDetailCommentModel.h"

@interface DetailCommentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avaterImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickNamelabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) NewDetailCommentModel *model;

- (IBAction)zanDidClick:(id)sender;

@end
