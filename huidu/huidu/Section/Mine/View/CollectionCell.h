//
//  CollectionCell.h
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/7/31.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectModel.h"

@protocol CollectionCellDelegate <NSObject>

- (void)selectButtonDidClick: (NSIndexPath *)indexPath withButton: (UIButton *)button;

@end

@interface CollectionCell : UITableViewCell

@property (nonatomic, assign) id<CollectionCellDelegate> delegate;
@property (nonatomic , strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) CollectModel *model;

@end
