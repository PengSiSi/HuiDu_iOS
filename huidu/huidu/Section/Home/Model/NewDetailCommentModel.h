//
//  NewDetailCommentModel.h
//  huidu
//
//  Created by 思 彭 on 2017/8/7.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewDetailCommentModel : NSObject

/**
 {
	id = 245;
	content = 234234234;
	add_time = 2017-08-01 11:26:20;
	sort = <null>;
	video_id = <null>;
	article_id = 1738;
	up_time = 0000-00-00 00:00:00;
	click_num = <null>;
	topic_id = <null>;
	topic_vd_id = <null>;
	headimgurl = https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erK8DDc7UfatTXZ9ySG9EiannhmotRmHn2CFMeEAz6GM6NIEtk3nxcJ179j1Hupmx8JNwpe5e80UlA/0;
	nickname = 很靠谱的青年;
	favor_num = 6;
	status = 1;
	member_id = 649856;
 }
 */
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *add_time;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *video_id;
@property (nonatomic, copy) NSString *article_id;
@property (nonatomic, copy) NSString *up_time;
@property (nonatomic, copy) NSString *click_num;
@property (nonatomic, copy) NSString *topic_id;
@property (nonatomic, copy) NSString *topic_vd_id;
@property (nonatomic, copy) NSString *headimgurl;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *favor_num;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *member_id;

@end
