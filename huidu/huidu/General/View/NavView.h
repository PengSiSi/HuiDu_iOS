//
//  NavView.h
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SearchBarSearchButtonClickedBlock)(NSString *searchText);

@interface NavView : UIView

@property (nonatomic, copy) SearchBarSearchButtonClickedBlock searchBlock;

@end
