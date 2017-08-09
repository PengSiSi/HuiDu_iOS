//
//  ThreeImageCell.m
//  huidu
//
//  Created by 中惠旅 on 17/7/19.
//  Copyright © 2017年 中惠旅. All rights reserved.
//

#import "ThreeImageCell.h"
#import "News.h"
#import "UIImageView+WebCache.h"

@interface ThreeImageCell ()
@property (nonatomic,strong) UIImageView *ImgView;//新闻图片
@property (nonatomic,strong) UIImageView *ImgView2;//新闻图片2
@property (nonatomic,strong) UIImageView *ImgView3;//新闻图片3
@property (nonatomic,strong) UILabel *nameLable;//新闻栏目名称
@property (nonatomic,strong) UILabel *timeLable;//发布时间
@property (nonatomic,strong) UILabel *titleLable;//新闻标题
@property (nonatomic,strong) UILabel *commentLable;//评论

@end

@implementation ThreeImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, K_SCREEN_WIDTH - 10, 40)];
        _titleLable.numberOfLines = 2;
//        _titleLable.backgroundColor = [UIColor redColor];
        
        _ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _titleLable.bottom + 5, 100, 60)];
//        _ImgView.backgroundColor = [UIColor cyanColor];
        
        _ImgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(110, _titleLable.bottom + 5, 100, 60)];
        
        _ImgView3 = [[UIImageView alloc]initWithFrame:CGRectMake(215, _titleLable.bottom + 5, 100, 60)];
//        _ImgView.backgroundColor = [UIColor cyanColor];
        
        _nameLable = [[UILabel alloc]initWithFrame:CGRectMake(5, _ImgView.bottom + 5, 60, 20)];
//        _nameLable.backgroundColor = [UIColor greenColor];
        
        _commentLable = [[UILabel alloc]initWithFrame:CGRectMake(_nameLable.right + 10, _nameLable.top, 40, 20)];
//        _commentLable.backgroundColor = [UIColor purpleColor];
        
        
        _timeLable = [[UILabel alloc]initWithFrame:CGRectMake(_commentLable.right + 10, _commentLable.top, K_SCREEN_WIDTH - 120, 20)];
//        _timeLable.backgroundColor = [UIColor blueColor];
        
        
        
        [self.contentView addSubview:_ImgView];
        [self.contentView addSubview:_ImgView2];
        [self.contentView addSubview:_ImgView3];
        [self.contentView addSubview:_nameLable];
        [self.contentView addSubview:_timeLable];
        [self.contentView addSubview:_titleLable];
        [self.contentView addSubview:_commentLable];
        
    }
    
    return self;
}

- (void)setNews:(News *)news{
    
    _news = news;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //填充数据
    NSURL *url = [NSURL URLWithString:_news.pic1];
    [_ImgView sd_setImageWithURL:url];
    
    NSURL *urlstr = [NSURL URLWithString:_news.pic2];
    [_ImgView2 sd_setImageWithURL:urlstr];
    
    NSURL *urlstring = [NSURL URLWithString:_news.pic3];
    [_ImgView3 sd_setImageWithURL:urlstring];

    _nameLable.text = _news.username;
    _nameLable.font = [UIFont systemFontOfSize:12];
    _nameLable.textAlignment = NSTextAlignmentCenter;
    
    _titleLable.text = _news.title;
    _titleLable.font = [UIFont systemFontOfSize:13];
    
    _commentLable.text = [NSString stringWithFormat:@"评论:%@",_news.share_num];
    _commentLable.font = [UIFont systemFontOfSize:12];
    
    _timeLable.text = [NSString stringWithFormat:@"发表于%@",_news.add_time];
    _timeLable.font = [UIFont systemFontOfSize:12];
}


@end
