//
//  WebviewCell.m
//  LoadingHtml
//
//  Created by chuanglong02 on 16/10/25.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "WebviewCell.h"
@interface WebviewCell()<UIWebViewDelegate>

@property(nonatomic,strong) UIWebView *webview;
@property (nonatomic, strong) UILabel *titleLabel;

@end

static CGFloat staticheight = 0;

@implementation WebviewCell

+ (CGFloat)cellHeight {
    
    return staticheight;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        
//        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, K_SCREEN_WIDTH - 20, 30)];
//        self.titleLabel.font = FONT_15;
//        self.titleLabel.backgroundColor = [UIColor cyanColor];
//        self.titleLabel.numberOfLines = 0;
//        self.titleLabel.text = @"keejfe fev evkv eve";
//        [self.contentView addSubview:self.titleLabel];
//        self.webview.frame = CGRectMake(0, _titleLabel.bottom, K_SCREEN_WIDTH, 0);
        [self.contentView addSubview:self.webview];
    }
    return self;
}

//-(void)setHtmlString:(NSString *)htmlString
//{
//    _htmlString = htmlString;
//    
//    self.webview.delegate = self;
//    // 否则导致网页下方留出了多余的空白
//    // 手动改变图片适配问题，拼接html代码后，再加载html代码
//    NSString *myStr = [NSString stringWithFormat:@"<head><style>img{max-    width:%f !important;}</style></head>", [UIScreen mainScreen].bounds.size.width - 20];
//    NSString *str = [NSString stringWithFormat:@"%@%@",myStr, htmlString];
//    [self.webview loadHTMLString:str baseURL:nil];
//}

- (void)setModel:(HDNewsDetailModel *)model {
    
    _model = model;
    CGFloat height = [NSString sizeWithString:self.model.title font:FONT_15 maxSize:CGSizeMake(K_SCREEN_WIDTH - 20, 99999)].height;
    self.titleLabel.frame = CGRectMake(10, 0, K_SCREEN_WIDTH - 20, height);
    self.titleLabel.text = self.model.title;
    self.webview.delegate = self;
    // 否则导致网页下方留出了多余的空白
    // 手动改变图片适配问题，拼接html代码后，再加载html代码
    NSString *myStr = [NSString stringWithFormat:@"<head><style>img{max-    width:%f !important;}</style></head>", [UIScreen mainScreen].bounds.size.width - 20];
    NSString *str = [NSString stringWithFormat:@"%@%@",myStr, model.content];
    [self.webview loadHTMLString:str baseURL:nil];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue]+50 ;
    self.webview.frame = CGRectMake(0, 0, K_SCREEN_WIDTH, height);
    self.webview.hidden = NO;
    if (staticheight != height+1) {
        staticheight = height+1;
        if (staticheight > 0) {
            if (_reloadBlock) {
                _reloadBlock();
            }
        }
    }
}

-(UIWebView *)webview {
    
    if (!_webview) {
        _webview =[[UIWebView alloc]initWithFrame:CGRectMake(0, self.titleLabel.bottom, K_SCREEN_WIDTH, 0)];
        _webview.userInteractionEnabled = NO;
        _webview.hidden = YES;
    }
    return _webview;
}
@end
