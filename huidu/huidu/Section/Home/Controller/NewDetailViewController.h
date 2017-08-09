//
//  NewDetailViewController.h
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "BaseViewController.h"
@class News;

@interface NewDetailViewController : BaseViewController

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic,strong) News *model;

@end
