//
//  MainViewController.m
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/8/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/)\
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]


@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setUI {
    NSArray *selectImage = @[@"2x_xinwen1",@"2x_shiping1",@"2x_zhuanti1",@"2x_wode1"];
    NSArray *normalImage = @[@"2x_xinwen2",@"2x_shiping2",@"2x_zhuanti2",@"2x_wode2"];
    NSArray *vcClass = @[@"HomeViewController",@"VideoViewController",@"SpecialViewController",@"MineViewController"];
    NSArray *vcName = @[@"首页",@"视频",@"专题",@"我的"];
    NSMutableArray *allArray = [NSMutableArray array];
    
    for (int i = 0; i < vcClass.count; i++) {
        
        Class cla = NSClassFromString(vcClass[i]);
        UIViewController *vc = [[cla alloc] init];
        vc.title = vcName[i];
        [vc.tabBarItem setImage:[[UIImage imageNamed:normalImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setTitle:vcName[i]];
//        if (i == 1) {
//            vc.tabBarItem.badgeValue = @"3";
//        }
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [allArray addObject:nav];
    }
    
    self.tabBar.backgroundColor = [UIColor redColor];
    self.viewControllers = allArray;
    [self.tabBar setTintColor:MAIN_COLOR];
    
    //设置TabBar背景颜色
    [self setUpTabBarItemTextAttributes];
}

/**
 *  设置TabBar背景颜色
 */
- (void)setUpTabBarItemTextAttributes {
    UITabBar *tabBarAppearance = [UITabBar appearance];
    tabBarAppearance.barTintColor = [UIColor whiteColor];
}

@end
