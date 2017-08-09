//
//  News.m
//  huidu
//
//  Created by 中惠旅 on 17/7/3.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import "News.h"

@implementation News

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        
        self.newsId = [value integerValue];
    }
}

@end
