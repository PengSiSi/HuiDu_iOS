//
//  BaseNavigationController.m
//  PSWeather
//
//  Created by 思 彭 on 16/11/16.
//  Copyright © 2016年 思 彭. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIBarButtonItem+Base.h"

@implementation BaseNavigationController
{
    NSArray *userInfos;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        NSString *backBtnImgName = @"1x_fanhui2";
        if (self.backBtnImgWhite) {
            backBtnImgName = @"1x_fanhui2";
        }else {
            backBtnImgName = @"1x_fanhui2";
        }
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:backBtnImgName higlightedImage:backBtnImgName title:self.backBtnTitle.length > 0 ? self.backBtnTitle : @" " target:self action:@selector(back)];
        
        // 添加返回按钮
        //        if ([viewController isKindOfClass:[MWPhotoBrowser class]]) {
        //            //如果是图片浏览器，那么返回导航按钮显示白色图片
        //             viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"leftNavBackWhite" higlightedImage:@"leftNavBackWhite" target:self action:@selector(back)];
        //        } else {
        //            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"leftNavBack" higlightedImage:@"leftNavBack" title:self.backBtnTitle? self.backBtnTitle : @"" target:self action:@selector(back)];
        //        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    self.backBtnTitle = @"";
    [self popViewControllerAnimated:YES];
}

// 设置电池颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}

@end
