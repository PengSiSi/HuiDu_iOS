//
//  SpecialListViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "SpecialListViewController.h"
#import "SpecialListTableViewCell.h"
#import "UIView+AdjustFrame.h"
#import "NewDetailViewController.h"
#import "NavView.h"
#import "UIColor+HexColor.h"
#import <SVProgressHUD.h>
#import "CombancHUD.h"

static NSString *identify = @"specialCell";

@interface SpecialListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *newslist;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SpecialListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 设置导航默认标题的颜色及字体大小
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor], UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:@"#4bb6ac"];
    [self setupUI];
    [self setupHeaderView];
    [self loadData];
    
//    [self setupNavView];
}
//
//- (void)viewWillAppear:(BOOL)animated {
//    
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//}

//- (void)setupNavView {
//    
//    NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 64)];
//    [self.view addSubview:navView];
//}

- (void)loadData {
    [CombancHUD show];
}

#pragma mark - 设置界面

- (void)setupUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 注册cell
    [self.tableView registerClass:[SpecialListTableViewCell class] forCellReuseIdentifier:identify];
    [self.view addSubview: self.tableView];
}

- (void)setupHeaderView {
    
    UIImageView *headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width , 200)];
    headerImgView.image = [UIImage imageNamed:@"buhuinikan2"];
    self.tableView.tableHeaderView = headerImgView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SpecialListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[NewDetailViewController new] animated:YES];
}
@end
