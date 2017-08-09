//
//  News.h
//  huidu
//
//  Created by 中惠旅 on 17/7/3.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic,copy) NSString *username;//新闻栏目
@property (nonatomic,copy) NSString *pic1;//新闻图片
@property (nonatomic,retain) NSString *add_time;//发布时间
@property (nonatomic,copy) NSString *title;//新闻标题
@property (nonatomic,assign) NSNumber *clicks_num;//阅读量
@property (nonatomic,assign) NSNumber *share_num;//评论量
@property (nonatomic,strong) NSString *thumb;
@property (nonatomic,copy) NSString *pic2;//新闻图片
@property (nonatomic,copy) NSString *pic3;//新闻图片
@property (nonatomic,assign)NSInteger picCount;//图片数组

@property (nonatomic,assign) NSInteger newsId;
@property (nonatomic,assign) NSInteger id;

@end
