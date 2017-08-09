//
//  HDNewsDetailModel.m
//  huidu
//
//  Created by 杨范 on 2017/8/2.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import "HDNewsDetailModel.h"

@implementation HDNewsDetailModel

+ (instancetype)newsDetailModel:(NSDictionary *)dict {
    
     HDNewsDetailModel *model = [HDNewsDetailModel new];
    
    if (dict[@"id"]) {
        model.newsID = [dict[@"id"] integerValue];
    }
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}


@end
