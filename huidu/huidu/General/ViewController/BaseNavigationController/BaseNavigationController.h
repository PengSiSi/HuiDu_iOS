//
//  BaseNavigationController.h
//  PSWeather
//
//  Created by 思 彭 on 16/11/16.
//  Copyright © 2016年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

@property (nonatomic, strong) NSString *backBtnTitle; /**< 返回按钮的名*/

@property (nonatomic, assign) BOOL backBtnImgWhite; /**< 返回按钮是否是白色*/

@end

