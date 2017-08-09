//
//  MineNoLoginHeaderView.m
//  huidu
//
//  Created by 思 彭 on 2017/8/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MineNoLoginHeaderView.h"

@interface MineNoLoginHeaderView ()

@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation MineNoLoginHeaderView

- (instancetype)initWithFrame: (CGRect)frame imageNameArray: (NSArray *)imgArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.imagesArray = imgArray;
        [self createSubViews];
        [self layOut];
        [self testUI];
    }
    return self;
}

- (void)createSubViews {
    CGFloat itemSpace = (K_SCREEN_WIDTH - 3 * 50) / 4;
    CGFloat itemHeight = 50;
    for (NSInteger i = 0; i < self.imagesArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(itemHeight + ((i * itemSpace)) + (itemHeight * i), 10, itemHeight, itemHeight)];
        imageView.image = [UIImage imageNamed:self.imagesArray[i]];
        [self addSubview:imageView];
    }
}

- (void)layOut {
    
}

- (void)testUI {
    
}


@end
