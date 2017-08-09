//
//  CollectModel.h
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/8/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, copy) NSString *ID;

@end
