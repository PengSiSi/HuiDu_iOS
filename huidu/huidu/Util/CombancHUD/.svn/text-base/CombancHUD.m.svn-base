//
//  CombancHUD.m
//  Donghuamen
//
//  Created by AlicePan on 16/9/19.
//  Copyright © 2016年 Combanc. All rights reserved.
//

#import "CombancHUD.h"

#define TIMEINTERVAL 0.7

@implementation CombancHUD

+ (void)setBackgroundColor:(UIColor*)color {
    [SVProgressHUD setBackgroundColor:color];
}

#pragma mark - show

+ (void)show {
    [SVProgressHUD show];
    [SVProgressHUD setMinimumDismissTimeInterval:TIMEINTERVAL];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

+ (void)showWithMaskType:(SVProgressHUDMaskType)maskType {
    [SVProgressHUD show];
    [SVProgressHUD setMinimumDismissTimeInterval:TIMEINTERVAL];
    [SVProgressHUD setDefaultMaskType:maskType];
}

+ (void)showWithTimeInterval:(NSTimeInterval)interval {
    [SVProgressHUD show];
    [SVProgressHUD setMinimumDismissTimeInterval:interval];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

+ (void)showWith:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle timeInterval:(NSTimeInterval)interval {
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD setDefaultAnimationType:animationType];
    [SVProgressHUD setDefaultStyle:hudStyle];
    [SVProgressHUD setMinimumDismissTimeInterval:interval];
}

#pragma mark - showWithStatus

+ (void)showWithStatus:(NSString *)status {
    [SVProgressHUD showWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:TIMEINTERVAL];
     [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

+ (void)showWithStatus:(NSString *)status timeInterval:(NSTimeInterval)interval {
    [SVProgressHUD showWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:interval];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

+ (void)showWithStatus:(NSString *)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle timeInterval:(NSTimeInterval)interval {
    [SVProgressHUD showWithStatus:status];
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD setDefaultAnimationType:animationType];
    [SVProgressHUD setDefaultStyle:hudStyle];
    [SVProgressHUD setMinimumDismissTimeInterval:interval];
}

#pragma mark - showInfo

+ (void)showInfoWithStatus:(NSString *)status {
    [SVProgressHUD showInfoWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:TIMEINTERVAL];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

+(void)showInfoWithStatus:(NSString *)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle timeInterval:(NSTimeInterval)interval {
    [SVProgressHUD showInfoWithStatus:status];
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD setDefaultAnimationType:animationType];
    [SVProgressHUD setDefaultStyle:hudStyle];
    [SVProgressHUD setMinimumDismissTimeInterval:interval];
}

#pragma mark - showSuccess

+ (void)showSuccessWithStatus:(NSString *)status {
    [SVProgressHUD showSuccessWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:TIMEINTERVAL];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

+ (void)showSuccessWithStatus:(NSString *)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle {
    [SVProgressHUD showSuccessWithStatus:status];
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD setDefaultAnimationType:animationType];
    [SVProgressHUD setDefaultStyle:hudStyle];
}

#pragma mark - showError

+ (void)showErrorWithStatus:(NSString *)status {
    [SVProgressHUD showErrorWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:TIMEINTERVAL];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

+ (void)showErrorWithStatus:(NSString *)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle {
    [SVProgressHUD showErrorWithStatus:status];
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD setDefaultAnimationType:animationType];
    [SVProgressHUD setDefaultStyle:hudStyle];
}

+ (void)showErrorWithError:(NSError *)error {
    if ([error.localizedDescription isEqualToString:@"Request failed: internal server error (500)"]) {
        [SVProgressHUD showErrorWithStatus:kREQUESTSERVICEERROR];
    }else if ([error.localizedDescription isEqualToString:@"请求超时。"]) {
        [SVProgressHUD showErrorWithStatus:KREQUESTOVERTIME];
    }else if ([error.localizedDescription isEqualToString:@"似乎已断开与互联网的连接。"]) {
        [SVProgressHUD showErrorWithStatus:KREQUESTERROR];
    }else {
        [SVProgressHUD showErrorWithStatus:kREQUESTUNKNOWERROR];
    }
}

#pragma mark - showImage

+ (void)showImage:(UIImage *)image status:(NSString *)status {
    [SVProgressHUD showImage:image status:status];
    [SVProgressHUD setMinimumDismissTimeInterval:TIMEINTERVAL];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

+ (void)showImage:(UIImage *)image status:(NSString *)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle {
    [SVProgressHUD showImage:image status:status];
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD setDefaultAnimationType:animationType];
    [SVProgressHUD setDefaultStyle:hudStyle];
}

#pragma mark - showProgress

+ (void)showProgress:(float)progress {
    [SVProgressHUD showProgress:progress];
}

+ (void)showProgress:(float)progress WithMaskType:(SVProgressHUDMaskType)maskType {
    [SVProgressHUD showProgress:progress];
    [SVProgressHUD setDefaultMaskType:maskType];
}

+ (void)showProgress:(float)progress WithMaskType:(SVProgressHUDMaskType)maskType hudStyle:(SVProgressHUDStyle)hudStyle {
    [SVProgressHUD showProgress:progress];
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD setDefaultStyle:hudStyle];
}

+ (void)showProgress:(float)progress WithMaskType:(SVProgressHUDMaskType)maskType hudStyle:(SVProgressHUDStyle)hudStyle backgroundColor:(UIColor *)backgroudColor backgroundLayerColor:(UIColor *)backgroundLayerColor {
    [SVProgressHUD showProgress:progress];
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD setDefaultStyle:hudStyle];
    [SVProgressHUD setBackgroundColor:backgroudColor];
    [SVProgressHUD setBackgroundLayerColor:[UIColor clearColor]];
}

#pragma mark - dismiss

+ (void)dismiss {
    [SVProgressHUD dismiss];
}

+ (void)dismissWithDelay:(NSTimeInterval)delay {
    [SVProgressHUD dismissWithDelay:delay];
}


@end
