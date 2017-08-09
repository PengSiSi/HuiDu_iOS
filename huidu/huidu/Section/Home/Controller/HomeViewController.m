//
//  HomeViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "HomeViewController.h"
#import "NavView.h"
#import "HomeListViewController.h"
//#import <MJRefresh.h>

@interface HomeViewController ()

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation HomeViewController

- (instancetype)init {
    if (self = [super init]) {
        self.menuBGColor = [UIColor whiteColor];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = K_SCREEN_WIDTH/self.titleArray.count;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 19;
        self.menuHeight = PAGEVC_MENU_HEIGHT;
        self.progressColor = [UIColor whiteColor]; //进度条颜色
        self.titleColorSelected = MAIN_COLOR; //标题选中时的颜色
        self.titleColorNormal = [UIColor blackColor];  //标题非选中的颜色
        self.menuBGColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"head_background_long2"]];
        }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavView];
    //设置各个标签名字
    self.titleArray = @[@"头条",@"科技",@"旅游",@"财经",@"娱乐",@"文化"];
}

// 注意: 数组没有值导致不显示
- (NSArray *)titleArray {
    
    return @[@"头条",@"科技",@"旅游",@"财经",@"娱乐",@"文化"];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)setupNavView {
    
    NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    [self.view bringSubviewToFront:navView];
    navView.searchBlock = ^(NSString *searchText) {
        NSLog(@"searchText--%@",searchText);
    };
}

#pragma mark - WMPageControllerDataSource

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    
    return 6;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    HomeListViewController *homeListVc = [[HomeListViewController alloc]init];
    homeListVc.name = self.titleArray[index];
    return homeListVc;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titleArray[index];
}

- (void)menuView:(WMMenuView *)menu didLayoutItemFrame:(WMMenuItem *)menuItem atIndex:(NSInteger)index {
    //    NSLog(@"frame---%@", NSStringFromCGRect(menuItem.frame));
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
//    HomeListViewController *homeListVc = [[HomeListViewController alloc]init];
//    homeListVc.name = self.titles[self.selectIndex];
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}



@end
