//
//  HDVideoHomeModel.m
//  huidu
//
//  Created by 曹慧林 on 2017/7/18.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import "HDVideoHomeModel.h"

@implementation HDVideoHomeModel

+ (instancetype)videoHomeModel:(NSDictionary *)dict {
    
    HDVideoHomeModel *model = [HDVideoHomeModel new];
    
    if (dict[@"id"]) {
        model.videoID = [dict[@"id"] integerValue];
    }
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end

