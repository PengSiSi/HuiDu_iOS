//
//  VideoViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "VideoViewController.h"
#import "NavView.h"
#import "VideoTableViewCell.h"
#import "VideoSectionHeaderView.h"
#import "VideoDetailViewController.h"
#import "HTTPTool.h"
#import "CombancHUD.h"
#import <MJExtension.h>
#import "HDVideoHomeModel.h"

static NSString *const VIDEO_CELLID = @"VideoTableViewCell";
static NSString *const VIDEO_HEADERID = @"headerView";

@interface VideoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.dataArray = [NSMutableArray array];
    [self setupNavView];
    [self setupUI];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)setupNavView {
    
    NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
}

- (void)loadData{
    [CombancHUD show];
    [HTTPTool postWithURL:@"http://huidu.zhonghuilv.net/video/index" headers:nil params:nil success:^(id json) {
//        if (self.dataArray.count > 0) {
//            [self.dataArray removeAllObjects];
//        }
//        for (NSDictionary *dic in json) {
//            HDVideoHomeModel *model = [HDVideoHomeModel videoHomeModel:dic];
//            [self.dataArray addObject:model];
//        }
        NSLog(@"%@",json);
        self.dataArray = [HDVideoHomeModel mj_objectArrayWithKeyValuesArray:json];
        [self.tableView reloadData];
        [CombancHUD dismiss];
    } failure:^(NSError *error) {
        [CombancHUD showErrorWithStatus:@"加载失败"];
    }];
}

#pragma mark - 设置界面

- (void)setupUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64 - 44) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([VideoTableViewCell class]) bundle:nil] forCellReuseIdentifier:VIDEO_CELLID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([VideoSectionHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:VIDEO_HEADERID];
    [self.view addSubview: self.tableView];
}

- (void)setupHeaderView {
    
    UIImageView *headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width , 200)];
    headerImgView.image = [UIImage imageNamed:@"buhuinikan2"];
    self.tableView.tableHeaderView = headerImgView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VIDEO_CELLID forIndexPath:indexPath];
    HDVideoHomeModel *model = self.dataArray[indexPath.section];
    [cell configureVideoTableViewCellWithImgName:model.img_path title:model.video_name];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    VideoSectionHeaderView *headerView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([VideoSectionHeaderView class]) owner:self options:nil] lastObject];
    HDVideoHomeModel *model = self.dataArray[section];
    [headerView configureVideoSectionHeaderViewWithVideoType:@"搞笑视频" playCount:model.pl_num avaterImgName:model.img_path];
    return headerView;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HDVideoHomeModel *model = self.dataArray[indexPath.section];
    VideoDetailViewController *detailVc = [[VideoDetailViewController alloc]init];
    detailVc.videoURL = model.video_path;
    [self.navigationController pushViewController:detailVc animated:YES];
}

@end
