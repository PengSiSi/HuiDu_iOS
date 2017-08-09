//
//  SegMentViewController.m
//  huidu
//
//  Created by 中惠旅 on 17/6/30.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import "SegMentViewController.h"

@interface SegMentViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIButton *segMentBtn;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIScrollView *backView;//内容滑动视图
@property (nonatomic,strong)UIScrollView *headerView;//顶部滑动视图
@property (nonatomic, strong) UIScrollView *headerSelectedView;
@property (nonatomic, strong) UIView *headerSelectedSuperView;
@property (nonatomic, strong) NSMutableArray *isFinishedArray;


@end

@implementation SegMentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)initSegment{
    
    switch (self.Type) {
        case 1: {
            self.buttonWidth = self.width/self.titleArray.count;
            [self addBackViewWithCount:self.titleArray.count];
            [self addScrollerHeader:self.titleArray];
            for (NSInteger i = 0; i < self.viewArray.count; i++) {
                [self.isFinishedArray addObject:@0];
            }
            [self initViewController:0];
            break;
        }
        case 0: {
            [self addBackViewWithCount:self.titleArray.count];
            [self addScrollerHeader:self.titleArray];
            for (NSInteger i = 0; i < self.viewArray.count; i++) {
                [self.isFinishedArray addObject:@0];
            }
            [self initViewController:0];
            
            break;
        }
            
        default:
            break;
    }
}


#pragma mark - private
- (void)initViewController:(NSInteger)index{
    
    if ([self.isFinishedArray[index]integerValue] == 0) {
        Class className = NSClassFromString(self.viewArray[index]);
        UIViewController *viewController = [[className alloc]init];
        [viewController.view setFrame:CGRectMake(self.width * index, 0, self.width, self.height - self.buttonHeight)];
        [self addChildViewController:viewController];
        [self.backView addSubview:viewController.view];
        self.isFinishedArray[index] = @1;
    }
}

//内容滑动视图
- (void)addBackViewWithCount:(NSInteger)count{
    
    self.backView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.buttonHeight, self.width, self.height - self.buttonHeight)];
    
    
#pragma MARK - 滑动BUG产生地方
    self.backView.contentSize = CGSizeMake(self.width *count, 0);
    
    [self.backView setPagingEnabled:YES];
    [self.backView setShowsVerticalScrollIndicator:NO];
    [self.backView setShowsHorizontalScrollIndicator:NO];
    self.backView.backgroundColor = self.backgroudColor;
    self.backView.bounces = NO;
    self.backView.delegate = self;
    [self.view addSubview:self.backView];
    
}

//顶部标签滑动视图
- (void)addScrollerHeader:(NSArray *)titleArray{
    
    self.headerView.frame = CGRectMake(0, 64, self.width, self.buttonHeight);
    self.headerView.contentSize = CGSizeMake(self.buttonWidth * titleArray.count, self.buttonHeight);
    [self.view addSubview:self.headerView];
    
    for (NSInteger index = 0; index < titleArray.count; index++) {
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.buttonWidth * index, 0, self.buttonWidth, self.buttonHeight)];
        _titleLabel.textColor = self.titleColor;
        _titleLabel.text = titleArray[index];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.headerView addSubview:_titleLabel];
        
        _segMentBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.buttonWidth * index, 0, self.buttonWidth, self.buttonHeight)];
        _segMentBtn.tag = index;
        [_segMentBtn setBackgroundColor:[UIColor clearColor]];
        [_segMentBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.headerView addSubview:_segMentBtn];
    }
    
    self.headerSelectedSuperView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.buttonWidth, self.buttonHeight)];
    [self.headerView addSubview:self.headerSelectedSuperView];
    
    self.headerSelectedView.frame = CGRectMake(0, 0, self.buttonWidth, self.buttonHeight);
    self.headerSelectedView.contentSize = CGSizeMake(self.buttonWidth *titleArray.count, self.buttonHeight);
    [self.headerSelectedSuperView addSubview:self.headerSelectedView];
    
    for (NSInteger index = 0; index < titleArray.count; index++) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.buttonWidth * index, 0, self.buttonWidth, self.buttonHeight)];
        _titleLabel.textColor = self.titleSelectedColor;
        _titleLabel.text = titleArray[index];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.headerSelectedView addSubview:_titleLabel];
    }
}




- (void)correctHeader:(UIScrollView *)scrollView
{
    if (scrollView == _backView) {
        CGFloat location = _headerSelectedView.contentOffset.x + self.buttonWidth/2 - self.width/2;
        
        if (location <= 0) {
            [UIView animateWithDuration:.3 animations:^{
                _headerView.contentOffset = CGPointMake(0, _headerSelectedView.contentOffset.y);
            }];
        }else if (location >= _headerView.contentSize.width - self.width) {
            [UIView animateWithDuration:.3 animations:^{
                _headerView.contentOffset = CGPointMake(_headerView.contentSize.width - self.width, _headerSelectedView.contentOffset.y);
            }];
        }else {
            if (_headerView.contentOffset.x != location) {
                [UIView animateWithDuration:.3 animations:^{
                    _headerView.contentOffset = CGPointMake(location, _headerSelectedView.contentOffset.y);
                }];
            }
        }
    }
}



- (void)clickAction:(UIButton *)btn{
    
    [self.backView scrollRectToVisible:CGRectMake(btn.tag * self.width, 0, self.backView.frame.size.width, self.backView.frame.size.height) animated:YES];
    [self didSelectSegmentIndex:btn.tag];
}

- (void)didSelectSegmentIndex:(NSInteger)index{
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    if (!self.vcCanScroll) {
//        scrollView.contentOffset = CGPointZero;
//    }
//    
//    if (scrollView.contentOffset.y <= 0) {
//        self.vcCanScroll = NO;
//        scrollView.contentOffset = CGPointZero;
//    }
    
    if (scrollView == _backView) {
        
        self.headerSelectedSuperView.frame = CGRectMake(scrollView.contentOffset.x *(self.buttonWidth /self.width), self.headerSelectedSuperView.frame.origin.y, self.headerSelectedSuperView.frame.size.width, self.headerSelectedSuperView.frame.size.height);
        
        self.headerSelectedView.contentOffset = CGPointMake(scrollView.contentOffset.x *(self.buttonWidth / self.width),0);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _backView) {
        [self correctHeader:scrollView];
        [self initViewController:(scrollView.contentOffset.x/self.width)];
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (scrollView == _backView) {
        [self correctHeader:scrollView];
        [self initViewController:(scrollView.contentOffset.x/self.width)];
    }
}


#pragma mark - getter
- (CGFloat)height{
    
    return self.view.frame.size.height;
}

- (CGFloat)width{
    
    return self.view.frame.size.width;
}

- (CGFloat)originX{
    
    return self.view.frame.origin.x;
}

- (CGFloat)originY{
    
    return self.view.frame.origin.y;
}

- (CGFloat)buttonWidth{
    
    if (_buttonWidth == 0) {
        
        _buttonWidth = self.width / 5;
    }
    
    return _buttonWidth;
}

- (CGFloat)buttonHeight{
    
    if (_buttonHeight == 0) {
        
        _buttonHeight = 40;
    }
    
    return _buttonHeight;
}

- (UIColor *)backgroudColor{
    
    if (_backgroudColor == nil) {
        
        _backgroudColor = [UIColor clearColor];
    }
    
    return _backgroudColor;
}

- (UIColor *)headerColor{
    
    if (_headerColor == nil) {
        
        _headerColor = [UIColor whiteColor];
    }
    
    return _headerColor;
}

- (UIColor *)titleColor{
    
    if (_titleColor == nil) {
        
        _titleColor = [UIColor blackColor];
    }
    
    return _titleColor;
}

- (UIColor *)titleSelectedColor{
    
    if (_titleSelectedColor == nil) {
        
        _titleSelectedColor = [UIColor greenColor];
    }
    
    return _titleSelectedColor;
}

- (NSMutableArray *)isFinishedArray{
    
    if (_isFinishedArray == nil) {
        
        _isFinishedArray = [[NSMutableArray alloc]init];
        
    }
    
    return _isFinishedArray;
}

- (UIScrollView *)headerView{
    
    if (_headerView == nil) {
        
        _headerView = [[UIScrollView alloc]init];
        [_headerView setShowsHorizontalScrollIndicator:NO];
        [_headerView setShowsVerticalScrollIndicator:NO];
        _headerView.delegate = self;
        _headerView.bounces = NO;
        _headerView.backgroundColor = self.headerColor;
        
    }
    
    return _headerView;
}

- (UIScrollView *)headerSelectedView{
    
    if (_headerSelectedView == nil) {
        
        _headerSelectedView = [[UIScrollView alloc]init];
        [_headerSelectedView setShowsVerticalScrollIndicator:NO];
        [_headerSelectedView setShowsHorizontalScrollIndicator:NO];
        _headerSelectedView.userInteractionEnabled = NO;
        _headerSelectedView.delegate = self;
        _headerSelectedView.backgroundColor = self.headerColor;
        _headerSelectedView.clipsToBounds = YES;
    }
    
    return _headerSelectedView;
}


@end
