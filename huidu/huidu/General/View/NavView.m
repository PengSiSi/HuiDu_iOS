//
//  NavView.m
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "NavView.h"

// 颜色值RGB
#define RGBA(r,g,b,a)                       [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface NavView ()<UISearchBarDelegate>

@property (nonatomic, strong) UIImageView *logImgView;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation NavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHex:@"#275959"];
        [self createSubViews];
        [self layOut];
    }
    return self;
}

- (void)createSubViews {
    self.logImgView = [[UIImageView alloc]init];
    self.logImgView.image = [UIImage imageNamed:@"logo"];
    [self addSubview:self.logImgView];
//    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH - 100, 30)];
//    self.searchBar = searchBar;
//    [searchBar setTintColor:[UIColor whiteColor]];
//    searchBar.layer.cornerRadius = 5;
//    searchBar.layer.masksToBounds = YES;
    // 设置searchBar的背景颜色
//    searchBar.barTintColor = [UIColor whiteColor];
//    UIImageView *view = [[[searchBar.subviews objectAtIndex:0] subviews] firstObject];
//    view.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
//    view.layer.borderWidth = 1;
//    [searchBar setPlaceholder:@"搜索"];
    [self addSubview:self.searchBar];
    [self bringSubviewToFront:self.logImgView];
}

- (void)layOut {
    [self.logImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.top.mas_equalTo(self).offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(60);
    }];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.logImgView.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.height.mas_equalTo(35);
//        make.centerY.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(20);
    }];
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]init];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"搜索";
        _searchBar.layer.cornerRadius = 5.0;
        // 注意样式
//        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchBar.returnKeyType = UIReturnKeySearch;
        _searchBar.backgroundImage = [[UIImage alloc] init];
        _searchBar.backgroundColor = [UIColor whiteColor];
        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.tintColor = [UIColor whiteColor];
        ;
    }
    return _searchBar;
}

#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    [searchBar endEditing:YES];
    NSLog(@"text: %@", searchBar.text);
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar endEditing:YES];
    NSLog(@"text: %@", searchBar.text);
    if (self.searchBlock) {
        self.searchBlock(searchBar.text);
    }
}

@end
