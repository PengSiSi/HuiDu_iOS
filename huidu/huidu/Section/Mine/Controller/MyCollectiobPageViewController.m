//
//  MyCollectiobPageViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/6.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MyCollectiobPageViewController.h"

@interface MyCollectiobPageViewController ()

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, weak) UIButton *editButton;

@end

@implementation MyCollectiobPageViewController

- (instancetype)init {
    if (self = [super init]) {
        self.menuBGColor = [UIColor whiteColor];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = K_SCREEN_WIDTH / 2;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 19;
        self.menuHeight = PAGEVC_MENU_HEIGHT;
        self.progressColor = MAIN_COLOR; //进度条颜色
        self.titleColorSelected = MAIN_COLOR; //标题选中时的颜色
        self.titleColorNormal = [UIColor blackColor];  //标题非选中的颜色
        self.menuBGColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"head_background_long2"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavItem];
    self.navigationItem.title = @"我的收藏";
    //设置各个标签名字
    self.titleArray = @[@"文章",@"视频"];
}

#pragma mark - 设置界面

- (void)addNavItem {
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editButton = editButton;
    editButton.frame = CGRectMake(0, 0, 60, 30);
    [editButton addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    [editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    
    // 项目练习页面
    UIBarButtonItem *jumpItem = [[UIBarButtonItem alloc]initWithTitle:@"进入" style:UIBarButtonItemStylePlain target:self action:@selector(jumpMain)];
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:editButton]];
}

- (void)editAction: (UIBarButtonItem *)item {
    // 注意发送通知和改变按钮状态的顺序,否则会产生切换的延迟...
    // 发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"EditAndCancleChangeNotification" object:nil userInfo:@{@"buttonTitle": self.editButton.currentTitle}];
    if ([self.editButton.currentTitle isEqualToString:@"编辑"]) {
        [self.editButton setTitle:@"取消" forState:UIControlStateNormal];
    } else {
        [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
    }
}

// 注意: 数组没有值导致不显示
- (NSArray *)titleArray {
    
    return @[@"头条",@"科技",@"旅游",@"财经",@"娱乐",@"文化"];
}

#pragma mark - WMPageControllerDataSource

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    
    return 2;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    return [[CollectViewController alloc]init];
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titleArray[index];
}

- (void)menuView:(WMMenuView *)menu didLayoutItemFrame:(WMMenuItem *)menuItem atIndex:(NSInteger)index {
    //    NSLog(@"frame---%@", NSStringFromCGRect(menuItem.frame));
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
}

@end
