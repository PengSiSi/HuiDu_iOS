//
//  CombancHUD.h
//  Donghuamen
//
//  Created by AlicePan on 16/9/19.
//  Copyright © 2016年 Combanc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD.h>

@interface CombancHUD : NSObject

+ (void)setBackgroundColor:(UIColor*)color;  

#pragma mark - show
+ (void)show;
+ (void)showWithMaskType:(SVProgressHUDMaskType)maskType;
+ (void)showWithTimeInterval:(NSTimeInterval)interval;
+ (void)showWith:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle timeInterval:(NSTimeInterval)interval;

#pragma mark - showWithStatus
+ (void)showWithStatus:(NSString*)status;
+ (void)showWithStatus:(NSString*)status timeInterval:(NSTimeInterval)interval;
+ (void)showWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle timeInterval:(NSTimeInterval)interval;

#pragma mark - showInfo
+ (void)showInfoWithStatus:(NSString*)status;
+ (void)showInfoWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle timeInterval:(NSTimeInterval)interval;

#pragma mark - showSuccess
+ (void)showSuccessWithStatus:(NSString*)status;
+ (void)showSuccessWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle;

#pragma mark - showError
+ (void)showErrorWithStatus:(NSString*)status;
+ (void)showErrorWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle;
+ (void)showErrorWithError:(NSError *)error;

#pragma mark - showImage
+ (void)showImage:(UIImage*)image status:(NSString*)status;
+ (void)showImage:(UIImage*)image status:(NSString*)status maskType:(SVProgressHUDMaskType)maskType animationType:(SVProgressHUDAnimationType)animationType hudStyle:(SVProgressHUDStyle)hudStyle;

#pragma mark - showProgress
+ (void)showProgress:(float)progress;
+ (void)showProgress:(float)progress WithMaskType:(SVProgressHUDMaskType)maskType;
+ (void)showProgress:(float)progress WithMaskType:(SVProgressHUDMaskType)maskType hudStyle:(SVProgressHUDStyle)hudStyle;
+ (void)showProgress:(float)progress WithMaskType:(SVProgressHUDMaskType)maskType hudStyle:(SVProgressHUDStyle)hudStyle backgroundColor:(UIColor *)backgroudColor backgroundLayerColor:(UIColor *)backgroundLayerColor;


#pragma mark - dismiss
+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)delay;


@end
