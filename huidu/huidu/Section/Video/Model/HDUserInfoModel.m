//
//  HDUserInfoModel.m
//  huidu
//
//  Created by 曹慧林 on 2017/7/29.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import "HDUserInfoModel.h"

@implementation HDUserInfoModel

+ (instancetype)shared {
    static HDUserInfoModel * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HDUserInfoModel alloc]init];
    });
    return instance;
}

@end
