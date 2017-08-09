//
//  HDVideopl_Model.h
//  huidu
//
//  Created by 曹慧林 on 2017/7/28.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import <Foundation/Foundation.h>


//{
//    "id": 144,
//    "member_id": 649857,
//    "video_id": 172,
//    "article_id": 0,
//    "content": "nihao",
//    "favor_num": 0,
//    "status": 1,
//    "add_time": "2017-07-22 09:02:31",
//    "up_time": "0000-00-00 00:00:00",
//    "sort": null,
//    "click_num": null,
//    "nickname": "桥口",
//    "headimgurl": "http:\/\/wx.qlogo.cn\/mmopen\/Q3auHgzwzM55SgavMYVOhBZVXEb86k39EcGo0mxu6AXYvKg1EBPpprpFCCIwib3DiaVbdMvl3fjiaw8cj4dgSy3wQ\/0"
//}
@interface HDVideopl_Model : NSObject

@property (nonatomic, assign) NSInteger videlpl_id;

@property (nonatomic, assign) NSInteger member_id;

@property (nonatomic, assign) NSInteger video_id;

@property (nonatomic, assign) NSInteger article_id;

@property (nonatomic, assign) NSInteger favor_num;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *add_time;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *up_time;

@property (nonatomic, copy) NSString *headimgurl;

@property (nonatomic, assign) BOOL isSelected;

+ (instancetype)videopl_Model:(NSDictionary *)dict;

@end
