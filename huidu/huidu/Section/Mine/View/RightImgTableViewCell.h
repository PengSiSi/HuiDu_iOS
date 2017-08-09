//
//  RightImgTableViewCell.h
//  huidu
//
//  Created by 思 彭 on 2017/8/6.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectModel;

@protocol RightImgTableViewCellDelegate <NSObject>

- (void)selectButtonDidClick: (NSIndexPath *)indexPath withButton: (UIButton *)button;

@end

@interface RightImgTableViewCell : UITableViewCell

@property (nonatomic, assign) id<RightImgTableViewCellDelegate> delegate;
@property (nonatomic , strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) CollectModel *model;

@end
