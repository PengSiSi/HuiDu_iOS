//
//  SegMentViewController.h
//  huidu
//
//  Created by 中惠旅 on 17/6/30.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SegMentHeaderType){
    SegmentHeaderTypeScroll,//标签栏可滚动
    SegmentHeaderTypeFixed//标签栏固定
};

@interface SegMentViewController : UIViewController

//标签栏标题字符串数组
@property (nonatomic,strong)NSArray *titleArray;

//每个标签对应ViewController字符串数组
@property (nonatomic,strong)NSArray *viewArray;

//标签栏颜色，默认白色
@property (nonatomic,strong)UIColor *headerColor;

//非选中状态下标签字体颜色，默认黑色
@property (nonatomic,strong)UIColor *titleColor;

//选中标签字体颜色，默认绿色
@property (nonatomic,strong)UIColor *titleSelectedColor;

//segmentView背景色，默认透明
@property (nonatomic,strong)UIColor *backgroudColor;

//标签栏高度
@property (nonatomic,assign)CGFloat buttonHeight;

//标签栏每个按钮宽度
@property (nonatomic, assign)CGFloat buttonWidth;

//标签栏类型，默认为滚动标签栏
@property (nonatomic, assign) SegMentHeaderType Type;

// 控制器能否滚动
@property (nonatomic, assign) BOOL vcCanScroll;

//初始化方法，设置完titleArray和viewArray后调用
- (void)initSegment;

//点击标签栏按钮调用方法
- (void)didSelectSegmentIndex:(NSInteger)index;


@end
