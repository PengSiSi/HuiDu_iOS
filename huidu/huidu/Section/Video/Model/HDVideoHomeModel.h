//
//  HDVideoHomeModel.h
//  huidu
//
//  Created by 曹慧林 on 2017/7/18.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDVideoHomeModel : NSObject

//{
//    "id": 172,
//    "video_name": "ASICS #用黑, 向运动表白",
//    "video_path": "http:\/\/qiniu-xpc0.xpccdn.com\/59670f1562392.mp4\r\n",
//    "video_sort": 1,
//    "status": 1,
//    "type_id": 1,
//    "click_num": 0,
//    "share_num": 0,
//    "video_info": "ASICS #用黑, 向运动表白 #吉克隽逸",
//    "add_time": "2017-07-28 08:40:03",
//    "stamp_num": 11,
//    "like_num": 17,
//    "username": "ben-tseng",
//    "pl_num": 16,
//    "img_path": "http:\/\/cs.xinpianchang.com\/uploadfile\/article\/2017\/07\/13\/59670f6bc9854.jpeg@540w.jpg",
//    "content": null
//}
@property (nonatomic, copy) NSString *video_name;   // 视频名

@property (nonatomic, copy) NSString *video_path;   // 视频地址

@property (nonatomic, copy) NSString *username;     // 昵称

@property (nonatomic, assign) NSInteger click_num;  // 点击次数

@property (nonatomic, copy) NSString *img_path;     // 图片地址

@property (nonatomic, copy) NSString *pl_num;     // 评论次数

@property (nonatomic, copy) NSString *add_time;     // 添加时间

@property (nonatomic, assign) NSInteger like_num;   // 点赞次数

@property (nonatomic, assign) NSInteger stamp_num;  // 踩次数

@property (nonatomic, assign) NSInteger videoID;    // 编号

@property (nonatomic, assign) NSInteger share_num;

+ (instancetype)videoHomeModel:(NSDictionary *)dict;

@end



