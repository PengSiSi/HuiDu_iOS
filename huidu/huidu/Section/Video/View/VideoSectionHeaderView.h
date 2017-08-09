//
//  VideoSectionHeaderView.h
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoSectionHeaderView : UIView

- (void)configureVideoSectionHeaderViewWithVideoType: (NSString *)videoType playCount: (NSString *)playCount avaterImgName: (NSString *)iconName;
@end