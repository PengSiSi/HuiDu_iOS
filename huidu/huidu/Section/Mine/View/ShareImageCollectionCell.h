//
//  ShareImageCollectionCell.h
//  QianfengSchool
//
//  Created by chenhuan on 16/7/25.
//  Copyright © 2016年 Combanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShareShareImageCellDelegate <NSObject>

- (void)deleteImageWithButton:(UIButton *)btn;

@end

@interface ShareImageCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageV;/**<视图 */
@property (nonatomic, strong) UIButton *deleteImgBtn;/**<点击删除图片按钮 */
@property (nonatomic, weak) id<ShareShareImageCellDelegate> delegate;/**<删除图片代理 */

@end
