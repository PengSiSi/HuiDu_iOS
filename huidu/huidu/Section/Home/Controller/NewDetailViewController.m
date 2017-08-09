//
//  NewDetailViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "NewDetailViewController.h"
#import "NewDetailHeaderView.h"
#import "CommentBottomView.h"
#import "HTTPTool.h"
#import "HDNewsDetailModel.h"
#import "News.h"
#import "UIColor+HexColor.h"
#import "NewDetailCommentModel.h"
#import "WebviewCell.h"
#import "DetailCommentCell.h"

@interface NewDetailViewController ()<UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate, CommentBottomViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NewDetailHeaderView *headerView;
@property (nonatomic, strong) CommentBottomView *bottomView;
@property (nonatomic, assign) CGFloat keyBoardHeight;
@property (nonatomic, assign) CGFloat currentTextViewHeight;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic, strong) NSArray *commentArray; // 评论model数组
@property (nonatomic, strong) UITableView *commnetTableView;
@property (nonatomic, strong) HDNewsDetailModel *detailModel;

@end

@implementation NewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新闻详情页";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:@"#4bb6ac"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.currentTextViewHeight = 44;
    [self addNotification];
    [self setupHeaderView];
    [self setupBottomView];
    [self setupUI];
    [self addNavShareItem];
    [self requestData];
    [self requestCommentData];
}

- (void)addNavShareItem {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"1x_fenxiang"] style:UIBarButtonItemStylePlain target:self action:@selector(shareAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

#pragma mark - 键盘通知
- (void)addNotification {
    
    // 监听键盘的弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeHeight:) name:@"changeHeight" object:nil];
    
}

- (void)keyboardWillShow:(NSNotification *) notification {
    
    float animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat height = [[[notification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    self.keyBoardHeight = height;
    // 没有弹出键盘 使用这种动画比较顺畅一点
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect bottomBarFrame = self.bottomView.frame;
        bottomBarFrame.origin.y = [UIScreen mainScreen].bounds.size.height - height - self.currentTextViewHeight - 64;
        //    CGRect rc = [self.view convertRect: self.bottomView.frame toView:self.view];
        [self.bottomView setFrame:bottomBarFrame];
        // 这里注意: 需要把底部view移动到最前面显示
        [self.view bringSubviewToFront:self.bottomView];
    }];
}

- (void)keyboardWillHide:(NSNotification *) notification {
    float animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat height = [[[notification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    self.keyBoardHeight = height;
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect bottomBarFrame = self.bottomView.frame;
        bottomBarFrame.origin.y = self.view.bounds.size.height - self.currentTextViewHeight;
        [self.bottomView setFrame:bottomBarFrame];
    }];
}

- (void)changeHeight: (NSNotification *)notifi {
    CGFloat height = [notifi.userInfo[@"height"] floatValue];
    if (height > 44) {
        
        self.currentTextViewHeight = height;
    }
    NSLog(@"height --- %f",height);
    [UIView animateWithDuration:0.2 animations:^{
        CGRect bottomBarFrame = self.bottomView.frame;
        bottomBarFrame.origin.y = self.view.bounds.size.height - height - self.keyBoardHeight;
        bottomBarFrame.size.height = height + 30;
        [self.bottomView setFrame:bottomBarFrame];
    }];
}

#pragma mark - 设置界面

- (void)setupUI {
    [self.view addSubview:self.commnetTableView];
    self.commnetTableView.frame = CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_HEIGHT - 44 - 64);
}

- (void)setupHeaderView {
    
    self.headerView = [[NewDetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 70)];
    self.headerView.focusButtonBlock = ^(BOOL flag) {
        NSLog(@"flag -- %d",flag);
    };
    [self.commnetTableView setTableHeaderView:self.headerView];
}

- (void)setupBottomView {
    self.bottomView = [[CommentBottomView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44 - 64, [UIScreen mainScreen].bounds.size.width, 44)];
//    self.bottomView.delegate = self;
    self.bottomView.block = ^(NSInteger tag, UIButton *button) {
        NSLog(@"%ld", tag);
    };
    [self.view addSubview:self.bottomView];
}

#pragma mark - 数据请求

- (void)requestData {
    NSString *url = [NSString stringWithFormat:@"http://huidu.zhonghuilv.net/Index/newslist?newsid=%@",@(self.model.id)];
   [HTTPTool postWithURL:url headers:nil params:nil success:^(id json) {
       NSLog(@"json = %@",json);
       self.detailModel = [[HDNewsDetailModel alloc]init];
       [self.detailModel setValuesForKeysWithDictionary:json];
       [self.headerView configureHeaderAvaterWithImage:json[@"thumb"] title:json[@"username"]];
   } failure:^(NSError *error) {
       [CombancHUD showInfoWithStatus:@"加载失败"];
   }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.commentArray.count + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.text = self.detailModel.title;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = FONT_15;
        return cell;
    } else if (indexPath.row == 1) {
        WebviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WebviewCell" forIndexPath:indexPath];
        cell.model = self.detailModel;
        __weak NewDetailViewController *weakSelf = self;
        cell.reloadBlock =^()
        {   // 刷新webViewCell
//            [weakSelf.commnetTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            // 立即显示,直接刷新表视图cell
            [self.commnetTableView reloadData];
        };
        return cell;
    }
    DetailCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
    cell.model = self.commentArray[indexPath.row - 2];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        CGFloat height = [NSString sizeWithString:self.detailModel.title font:FONT_15 maxSize:CGSizeMake(K_SCREEN_WIDTH - 20, 99999)].height;
        return height + 10;
    } else if (indexPath.row == 1) {
//        NSLog(@"cellHeight---%f",[WebviewCell cellHeight]);
        return [WebviewCell cellHeight];
    } else {
        return 78;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 0.001f;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, K_SCREEN_WIDTH, 30)];
//    titleLabel.numberOfLines = 0;
//    titleLabel.font = FONT_15;
//    // 设置间距
//    titleLabel.text = [NSString stringWithFormat:@"   %@",self.detailModel.title];
//    return titleLabel;
//}

- (void)requestCommentData {
    // index/Articlepl
    NSString *url = [NSString stringWithFormat:@"http://huidu.zhonghuilv.net/index/Articlepl?newsid=%@",@(self.model.id)];
    [HTTPTool postWithURL:url headers:nil params:nil success:^(id json) {
        NSLog(@"json = %@",json);
        self.commentArray = [NewDetailCommentModel mj_objectArrayWithKeyValuesArray:json];
        [self.commnetTableView reloadData];
    } failure:^(NSError *error) {
        [CombancHUD showInfoWithStatus:@"加载失败"];
    }];
}

#pragma mark - CommentBottomViewDelegate

- (void)buttonDidClick:(UIButton *)button {
    
    switch (button.tag) {
        case 100:
            // 评论
            NSLog(@"评论");
            break;
        case 101:
            // 点赞
            break;
        case 102:
            // 分享
            break;
        default:
            break;
    }
}

#pragma mark - Private Method

- (void)shareAction: (UIBarButtonItem *)item {
    NSLog(@"分享");
}

- (UITableView *)commnetTableView {
    if (!_commnetTableView) {
        _commnetTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _commnetTableView.delegate = self;
        _commnetTableView.dataSource = self;
        [_commnetTableView registerNib:[UINib nibWithNibName:@"DetailCommentCell" bundle:nil] forCellReuseIdentifier:@"CommentCell"];
        [_commnetTableView registerClass:[WebviewCell class] forCellReuseIdentifier:@"WebviewCell"];
        [_commnetTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _commnetTableView.tableHeaderView = [UIView new];
        _commnetTableView.tableFooterView = [UIView new];
    }
    return _commnetTableView;
}

@end
