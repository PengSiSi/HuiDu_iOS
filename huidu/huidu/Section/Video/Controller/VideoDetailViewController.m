//
//  VideoDetailViewController.m
//  huidu
//
//  Created by 思 彭 on 2017/8/4.
//  Copyright © 2017年 思 彭. All rights reserved.

// 这里注意: 如果播放视频一直崩溃,将全局断点去掉即可.

#import "VideoDetailViewController.h"
#import "VideoInfoCell.h"
#import "VideoFollowCell.h"
#import "CommentBottomView.h"

@interface VideoDetailViewController ()<ZFPlayerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *fatherView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CommentBottomView *bottomView;

@end

@implementation VideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPlayerView];
    // 加上这句可以让tableView在视频播放的下面
    [self.view layoutSubviews];
    [self setupBottomView];
    [self setUI];
}

#pragma mark - lifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor clearColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden = NO;
    self.navigationController.navigationBarHidden = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

#pragma mark - 设置界面

- (void)setUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.fatherView.bottom, K_SCREEN_WIDTH, K_SCREEN_HEIGHT - self.fatherView.height - 44) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoInfoCell" bundle:nil] forCellReuseIdentifier:@"VideoInfoCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoFollowCell" bundle:nil] forCellReuseIdentifier:@"VideoFollowCell"];
    [self.view addSubview: self.tableView];
}

- (void)setupBottomView {
    self.bottomView = [[CommentBottomView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44)];
    [self.view addSubview:self.bottomView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        VideoInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoInfoCell" forIndexPath:indexPath];
        return cell;
    } else {
        VideoFollowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoFollowCell" forIndexPath:indexPath];
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 44;
    } else {
        return 94;
    }
}

// 视频播放器
- (void)createPlayerView {
    self.fatherView = [[UIView alloc] init];
    [self.view addSubview:self.fatherView];
    [self.fatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.equalTo(self.view);
        // 注意此处，宽高比16：9优先级比1000低就行，在因为iPhone 4S宽高比不是16：9
        make.height.equalTo(self.fatherView.mas_width).multipliedBy(9.0f/16.0f).with.priority(750);
    }];
    
    self.playerView = [[ZFPlayerView alloc] init];
    self.playerView.delegate = self;
    
    // 设置播放前的占位图（需要在设置视频URL之前设置）
    //    self.playerView.pl   = @"";
    // 设置视频的URL
    //    self.playerView.videoURL = [NSURL URLWithString:@""];
    //（可选设置）可以设置视频的填充模式，内部设置默认（ZFPlayerLayerGravityResizeAspect：等比例填充，直到一个维度到达区域边界）
    self.playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
    //    // 打开断点下载功能（默认没有这个功能）
    //#0	0x0000000106d6293a in __cxa_throw ()
    self.playerView.hasDownload = YES;
    // 如果想从xx秒开始播放视频
    // self.playerView.seekTime = 15;
    // 是否自动播放，默认不自动播放
    //    [self.playerView autoPlayTheVideo];
    //    __weak typeof(self) weakSelf = self;
    //    self.playerView.goBackBlock = ^{
    //        [weakSelf.navigationController popViewControllerAnimated:YES];
    //    };
    self.playerView.backgroundColor = [UIColor orangeColor];
    [self.playerView playerModel:self.playerModel];
    // 自动播放，默认不自动播放
//    [self.playerView autoPlayTheVideo];
    
}

#pragma mark - ZFPlayerDelegate

- (void)zf_playerBackAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Setter

- (ZFPlayerModel *)playerModel {
    if (!_playerModel) {
        _playerModel = [[ZFPlayerModel alloc] init];
        // @"http://baobab.wdjcdn.com/1456653443902B.mp4"
        // 这里暂时使用死数据
        _playerModel.videoURL = [NSURL URLWithString:@"http://baobab.wdjcdn.com/1456653443902B.mp4"];
        _playerModel.placeholderImage = [UIImage imageNamed:@"microcourse_video_window_default_img"];
        _playerModel.title = @"";
        _playerModel.fatherView = self.fatherView;
    }
    return _playerModel;
}


@end
