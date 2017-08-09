//
//  SpecialViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "SpecialViewController.h"
#import "SpecialListViewController.h"
#import "NavView.h"
#import "SpecialTableViewCell.h"

@interface SpecialViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *subTitleArray;

@end

@implementation SpecialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialData];
    [self setUI];
    [self setupNavView];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)initialData {
    
    self.titleArray = @[@"惠说新闻", @"有声旅行", @"不惠你看", @"有料旅行"];
    self.subTitleArray = @[@"古有事新说新语，尽头会说新闻", @"用声音陪你去远方", @"每个热爱生命的人,都值得呗柔情对待", @"生活就是一场吃吃喝喝的旅行"];
}

- (void)setupNavView {
    
    NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
}

#pragma mark - 设置界面

- (void)setUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, K_SCREEN_WIDTH, K_SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"SpecialTableViewCell" bundle:nil] forCellReuseIdentifier:@"SpecialTableViewCell"];
    [self.view addSubview: self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UIImageView *imgView;
//    static NSString *identify = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
//        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, K_SCREEN_WIDTH - 10, K_SCREEN_HEIGHT / 4 - 20)];
//        imgView.contentMode = UIViewContentModeScaleAspectFill;
//        [cell addSubview:imgView];
//    }
//    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"special%ld.png",indexPath.row + 1]];
    SpecialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialTableViewCell" forIndexPath:indexPath];
    [cell configureBgViewWithImageName:[NSString stringWithFormat:@"special%ld.png",indexPath.section + 1] title:self.titleArray[indexPath.section] sunTitle:self.subTitleArray[indexPath.section]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 20.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return K_SCREEN_HEIGHT / 4 - 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SpecialListViewController *specialListVc = [[SpecialListViewController alloc]init];
    [self.navigationController pushViewController:specialListVc animated:YES];
}

@end
