//
//  HDVideopl_Model.m
//  huidu
//
//  Created by 曹慧林 on 2017/7/28.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import "HDVideopl_Model.h"

@implementation HDVideopl_Model


+ (instancetype)videopl_Model:(NSDictionary *)dict {
    
    HDVideopl_Model *model = [HDVideopl_Model new];
    
    if (dict[@"id"]) {
        model.videlpl_id = [dict[@"id"] integerValue];
    }
    
    if (dict[@"headimgurl"]) {
        NSString *str = [dict[@"headimgurl"] stringByReplacingOccurrencesOfString:@"\\" withString:@""];
        
        model.headimgurl = str;
    }
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
