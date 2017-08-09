//
//  VideoDetailViewController.h
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "BaseViewController.h"
#import <ZFPlayer.h>

@class HDVideoHomeModel;

@interface VideoDetailViewController : BaseViewController

@property (nonatomic, strong) HDVideoHomeModel *model;
@property (nonatomic, strong) ZFPlayerView *playerView; /**< 视频播放器*/
@property (nonatomic, strong) ZFPlayerModel *playerModel; /**< 视频播放模型*/
@property (nonatomic, strong) NSString *videoURL;

@end
