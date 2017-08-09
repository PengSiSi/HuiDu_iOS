//
//  ImageContainerView.m
//  huidu
//
//  Created by 思 彭 on 2017/8/6.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "ImageContainerView.h"
#import "ShareImageCollectionCell.h"
#import <UIImageView+WebCache.h>

@interface ImageContainerView ()

@property (nonatomic, assign) CGFloat collectionHeight;/**<collection高度 */
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;/**<布局 */

@end

@implementation ImageContainerView


- (instancetype)init {
    
    if (self = [super init]) {
        
        [self setUI];
    }
    return self;
}

#pragma mark - 懒加载

- (UICollectionViewFlowLayout *)layout {
    
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.sectionInset = UIEdgeInsetsMake(0, 0, insetSpacing, insetSpacing);
        _layout.minimumLineSpacing = insetSpacing;
        _layout.minimumInteritemSpacing = insetSpacing;
    }
    return _layout;
}

- (UICollectionView *)shareImageCollectionView {
    
    if (!_shareImageCollectionView) {
        _shareImageCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _shareImageCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _shareImageCollectionView.delegate = self;
        _shareImageCollectionView.dataSource = self;
        _shareImageCollectionView.scrollEnabled = NO;
        _shareImageCollectionView.backgroundColor = [UIColor orangeColor];
        [_shareImageCollectionView registerClass:[ShareImageCollectionCell class] forCellWithReuseIdentifier:shareImageCellID];
    }
    return _shareImageCollectionView;
}

#pragma mark - 设置UI

- (void)setUI {
    
//    self.imageArray = [@[@"", @"", @""]mutableCopy];
//    //首次添加时默认高度为0
//    [self addSubview:self.shareImageCollectionView];
//    [self.shareImageCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self);
//        make.height.mas_equalTo(0);
//    }];
    
}

- (void)setImageArray:(NSMutableArray *)imageArray {
    _imageArray = imageArray;
    [self createImagesViews];
}

- (void)createImagesViews {
    for (NSInteger i = 0; i < self.imageArray.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.backgroundColor = [UIColor greenColor];
        imgView.image = [UIImage imageNamed:self.imageArray[i]];
        imgView.frame = CGRectMake(i * (K_SCREEN_WIDTH - 40)/ 3 + (i * 10), 0, (K_SCREEN_WIDTH - 40)/ 3, 80);
        [self addSubview:imgView];
    }
}

#pragma mark - CollectionViewDelegate && DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ShareImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shareImageCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    
    if ([[[self.imageArray firstObject] class] isEqual:[NSURL class]]) {
        [cell.imageV sd_setImageWithURL:self.imageArray[indexPath.item] placeholderImage:[UIImage imageNamed:@"f_hs_activities_album_without_icon"]];
    }else if ([[[self.imageArray firstObject] class] isEqual:[UIImage class]]) {
        cell.deleteImgBtn.hidden = NO;
        cell.deleteImgBtn.tag = indexPath.item;
        cell.imageV.image = self.imageArray[indexPath.item];
        cell.delegate = self;
    }else {
        cell.deleteImgBtn.hidden = NO;
        cell.deleteImgBtn.tag = indexPath.item;
        cell.imageV.image = [UIImage imageWithData:self.imageArray[indexPath.item]];
        cell.delegate = self;
    }
    
    return cell;
}

#if 0

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //点击事件
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = self.shareImageCollectionView; // 原图的父控件
    browser.imageCount = self.imageArray.count; // 图片总数
    browser.currentImageIndex = indexPath.item;
    
    browser.delegate = self;
    [browser show];
}

#pragma mark - flowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //    if (self.imageArray.count == 0) {
    //        return CGSizeMake(0, 0);
    //    }else if (self.imageArray.count == 1) {
    //        return CGSizeMake(cellItemWidth * 1.5, cellItemWidth * 1.5);
    //    }else if (self.imageArray.count < 4) {
    //        return CGSizeMake(cellItemWidth * 2, cellItemWidth * 2);
    //    }else if (self.imageArray.count == 4) {
    //        return CGSizeMake(cellItemWidth * 1.5, cellItemWidth * 1.5);
    //    }
    return CGSizeMake(cellItemWidth , cellItemWidth);
}
//cell的代理方法
- (void)deleteImageWithButton:(UIButton *)btn {
    
    [self.imageArray removeObjectAtIndex:btn.tag];
    self.deleteImageBlock(btn.tag);
    [self.shareImageCollectionView reloadData];
}

#pragma mark - photobrowser代理方法
// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
    
    ShareImageCollectionCell *cell = (ShareImageCollectionCell *)[self collectionView:self.shareImageCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    
    return cell.imageV.image;
}

//返回高质量图片的URL
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index {
    
    return nil;
}

#endif

#pragma mark - 计算图片的高度

- (void)getCollectionViewHeightWithArray:(NSArray *)imageArray {
    
    self.imageArray = [NSMutableArray arrayWithArray:imageArray];
    
    if (self.imageArray.count == 0) {
        self.collectionHeight = 0;
    }else if (self.imageArray.count == 1) {
        self.collectionHeight = cellItemWidth  + insetSpacing ;
    }else if (self.imageArray.count < 4) {
        self.collectionHeight = cellItemWidth  + insetSpacing * 2;
    }else if (self.imageArray.count == 4) {
        self.collectionHeight = cellItemWidth  * 2 + insetSpacing * 3;
    }else if (self.imageArray.count < 7){
        self.collectionHeight = cellItemWidth * 2 + insetSpacing * 4;
    }else {
        self.collectionHeight = cellItemWidth  * 3 + insetSpacing * 4;
    }
    
    __weak typeof(self) weakself = self;
    //    //不同的图片，高度不同
    if (self.imageArray.count == 1) {
        [self.shareImageCollectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
            make.height.width.mas_equalTo(weakself.collectionHeight);
        }];
    }else {
        [self.shareImageCollectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(weakself.collectionHeight);
        }];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
