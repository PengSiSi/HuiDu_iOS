//
//  HomeListViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "HomeListViewController.h"
#import "NewDetailViewController.h"
#import "NormalCell.h"
#import "TowImageCell.h"
#import "ThreeImageCell.h"
#import "News.h"
#import "HTTPTool.h"
#import <MJRefresh.h>

static NSString * normalID = @"NormalCell";
static NSString * TowImgID = @"TowImageCell";
static NSString * ThreeImgID = @"ThreeImageCell";


@interface HomeListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *newsList;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIPageControl *pagectrl;
@property (nonatomic,  strong) NSArray *images;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSInteger page;

@end

@implementation HomeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 0;
    _newsList = [NSMutableArray array];
    [self setUI];
    [self loadData];
    [self createMJRefresh];
    [_tableView.mj_header beginRefreshing];
}

- (void)loadData {
    
    NSDictionary *param = @{@"page":@(self.page),@"name":self.name};
    [HTTPTool getWithURL:@"http://huidu.zhonghuilv.net/index/send" headers:nil params:param success:^(id json) {
        NSArray *array = (NSArray *)json;
        
        for (NSDictionary *dic in array) {
            
            News *news = [[News alloc]init];
            
            [news setValuesForKeysWithDictionary:dic];
            if (news.pic1.length > 10) {
                news.picCount +=1;
            }
            if (news.pic2.length > 10) {
                news.picCount +=1;
            }
            if (news.pic3.length > 10) {
                news.picCount +=1;
            }
            [_newsList addObject:news];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [_tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)createMJRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page += 1;
        [self loadData];
    }];
}

#pragma mark - 设置界面

- (void)setUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 注册cell
    //注册单元格
    [_tableView registerClass:[NormalCell class] forCellReuseIdentifier:normalID];
    
    [_tableView registerClass:[TowImageCell class] forCellReuseIdentifier:TowImgID];
    
    [_tableView registerClass:[ThreeImageCell class] forCellReuseIdentifier:ThreeImgID];
    [self.view addSubview: self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_newsList[indexPath.row] picCount] == 1) {
        
        NormalCell*normalcell = [tableView dequeueReusableCellWithIdentifier:normalID forIndexPath:indexPath];
        News *news = _newsList[indexPath.row];
        normalcell.news = news;
        
        return normalcell;
    }else if ([_newsList[indexPath.row] picCount] == 2){
        
        TowImageCell*imagecell = [tableView dequeueReusableCellWithIdentifier:TowImgID forIndexPath:indexPath];
        News *news = _newsList[indexPath.row];
        imagecell.news = news;
        return imagecell;
    }else{
        ThreeImageCell*threeimgcell = [tableView dequeueReusableCellWithIdentifier:ThreeImgID forIndexPath:indexPath];
        News *news = _newsList[indexPath.row];
        threeimgcell.news = news;
        return threeimgcell;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_newsList[indexPath.row]picCount] == 1) {
        return 200;
    }
    
    return 140;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewDetailViewController *specialListVc = [[NewDetailViewController alloc]init];
    specialListVc.model = self.newsList[indexPath.row];
    [self.navigationController pushViewController:specialListVc animated:YES];
}

@end
