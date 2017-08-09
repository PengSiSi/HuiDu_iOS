//
//  ImageContainerView.h
//  huidu
//
//  Created by 思 彭 on 2017/8/6.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const shareImageCellID = @"SHAREIMAGE_CELLID";

#define cellItemWidth (getWidth(60) * 1.5)
#define insetSpacing (getWidth(5))

@interface ImageContainerView : UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *shareImageCollectionView;/**<分享图片 */
@property (nonatomic, copy) void(^deleteImageBlock)(NSInteger deletaIndex);/**<删除回调 */
@property (nonatomic, strong) NSMutableArray *imageArray;/**<图片数组 */

- (void)getCollectionViewHeightWithArray:(NSArray *)imageArray;

@end
