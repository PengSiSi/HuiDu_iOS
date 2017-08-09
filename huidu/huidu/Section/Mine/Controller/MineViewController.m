//
//  MineViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MineViewController.h"
#import "MineNoLoginHeaderView.h"
#import "MineLoginHeaderView.h"
#import "MyCollectiobPageViewController.h"

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // 设置导航默认标题的颜色及字体大小
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor], UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
    self.navigationController.navigationBar.barTintColor = MAIN_COLOR;
    [self initialData];
    [self setUI];
}

- (void)initialData {
    _titlesArray = @[@[@"我的文章",@"我的视频",@"我的问答",@"我的评论"],@[@"我的关注",@"我的收藏",@"我的分享"]];
    _imagesArray = @[@[@"weixin",@"weixin",@"weixin",@"weixin"],@[@"weixin",@"weixin",@"weixin"]];
}

#pragma mark - 设置界面

- (void)setUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    // 注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview: self.tableView];
//    self.tableView.tableHeaderView = [self setupLoginHeaderView];
    self.tableView.tableHeaderView = [self setupNoLoginHeaderView];
}

- (MineNoLoginHeaderView *)setupNoLoginHeaderView {
    
    return [[MineNoLoginHeaderView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 70) imageNameArray:@[@"QQ", @"weixin", @"QQ"]];
}

- (MineLoginHeaderView *)setupLoginHeaderView {
    
    return [[MineLoginHeaderView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 160)];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.titlesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *sectionArray = self.titlesArray[section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray *sectionArray = self.titlesArray[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *sectionImgArray = self.imagesArray[indexPath.section];
    cell.backgroundColor = [UIColor whiteColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:@""];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = sectionArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:sectionImgArray[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0001f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 1) {
        // 我的收藏
        [self.navigationController pushViewController:[MyCollectiobPageViewController new] animated:YES];
    }
}
@end
