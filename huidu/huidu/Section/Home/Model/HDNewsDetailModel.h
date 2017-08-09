//
//  HDNewsDetailModel.h
//  huidu
//
//  Created by 杨范 on 2017/8/2.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDNewsDetailModel : NSObject

//{
//    id: 388,
//topic_id: 1,
//member_id: 5,
//title: "惠说新闻 | 2017.7.25 星期二 农历闰六月初三",
//thumb: "http://wechats.zhonghuilv.net/uploads/article/20170727/b584735b5608ee153c28c3e5f976e09b.jpg",
//tag: "",
//desc: "惠说新闻 | 2017.7.25 星期二 农历闰六月初三",
//content: " data-w="640" style="width:auto;max-width:100%;"></p> <p><br></p> ",
//clicks_num: 31,
//clicks_id: 0,
//share_num: 0,
//share_id: 0,
//status: 1,
//is_base: 0,
//add_time: "2017-07-27 13:52:52",
//up_time: 0,
//like_num: 0,
//audio_path: null,
//username: null
//},

@property (nonatomic,copy) NSString *title;//标题

@property (nonatomic,copy) NSString *thumb;//图片地址

@property (nonatomic,copy)NSString *content;//文章内容

@property (nonatomic,assign) NSInteger clicks_num;

@property (nonatomic,assign) NSInteger newsID;//新闻编号



+ (instancetype)newsDetailModel:(NSDictionary *)dict;

@end
