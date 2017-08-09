//
//  CollectViewController.m
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/7/31.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "CollectViewController.h"
#import "CollectionCell.h"
#import "CollectModel.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "RightImgTableViewCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

static NSString *rightImageCellIdentify = @"rightCell";
static NSString *cellIdentify = @"collectCell";

@interface CollectViewController ()<UITableViewDelegate, UITableViewDataSource, CollectionCellDelegate, RightImgTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) UIButton *editButton;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *selectedArray;
@property (nonatomic, weak) UIView *bottomView;
@property (nonatomic, assign) BOOL isEditing; // "编辑"还是"完成"状态标示
@property (nonatomic, weak) UIView *spaceView;

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.selectedArray = [NSMutableArray array];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    [self setupUI];
    [self loadData];
    [self addNavItem];
    // 为避免重复接收通知,这里先移除
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(editAction:) name:@"EditAndCancleChangeNotification" object:nil];
}

- (void)loadData {
    self.dataArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        CollectModel *model = [[CollectModel alloc]init];
        model.ID = [NSString stringWithFormat:@"%ld",i];
        model.title = [NSString stringWithFormat:@"%ld---其实Masonry封装的API和苹果官方的思路是非常一致的",i];
        model.comment = @"233";
        model.time = @"2017年12月30日";
        model.isSelected = NO;
        [self.dataArray addObject:model];
    }
}

#pragma mark - 设置界面

- (void)addNavItem {
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editButton = editButton;
    editButton.frame = CGRectMake(0, 0, 60, 30);
    [editButton addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    [editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    
    // 项目练习页面
    UIBarButtonItem *jumpItem = [[UIBarButtonItem alloc]initWithTitle:@"进入" style:UIBarButtonItemStylePlain target:self action:@selector(jumpMain)];
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:editButton]];
}

- (void)jumpMain {
    
}

- (void)addBottomDeleteButtonView {
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 44 - 64, kScreenWidth, 44)];
    bottomView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    bottomView.layer.borderWidth = 0.5;
    self.bottomView = bottomView;
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    deleteButton.frame = CGRectMake(kScreenWidth - 80, 0, 60, 44);
    [deleteButton addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:deleteButton];
    [self.view addSubview:bottomView];
}

- (void)setupUI {
    
    UIView *spaceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 10)];
    spaceView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:spaceView];
    self.spaceView = spaceView;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(-20, 10, kScreenWidth + 20, kScreenHeight - 64 - 10) style:UITableViewStyleGrouped];
//    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 注册cell
    [self.tableView registerClass:[CollectionCell class] forCellReuseIdentifier:cellIdentify];
    [self.tableView registerClass:[RightImgTableViewCell class] forCellReuseIdentifier: rightImageCellIdentify];
    [self.view addSubview: self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2) {
        CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify forIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        cell.indexPath = indexPath;
        if (self.dataArray.count > 0) {
            CollectModel *model = self.dataArray[indexPath.row];
            cell.model = model;
            if (model.isSelected == YES) {
                [cell.selectButton setImage:[UIImage imageNamed:@"radio_choice"] forState:UIControlStateNormal];
            } else {
                [cell.selectButton setImage:[UIImage imageNamed:@"radio_nochoice"] forState:UIControlStateNormal];
            }
        }
        return cell;
    } else {
        RightImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightImageCellIdentify forIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        //    UIView *aView = [[UIView alloc] initWithFrame:cell.contentView.frame];
        //    aView.backgroundColor = [UIColor clearColor];
        //    cell.selectedBackgroundView = aView;   // 设置选中后cell的背景颜色
        //    if (cell.editing) {
        //        cell.backgroundColor = [UIColor clearColor];
        //    }
        cell.indexPath = indexPath;
        if (self.dataArray.count > 0) {
            CollectModel *model = self.dataArray[indexPath.row];
            cell.model = model;
            if (model.isSelected == YES) {
                [cell.selectButton setImage:[UIImage imageNamed:@"radio_choice"] forState:UIControlStateNormal];
            } else {
                [cell.selectButton setImage:[UIImage imageNamed:@"radio_nochoice"] forState:UIControlStateNormal];
            }
        }
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2) {
        return [tableView fd_heightForCellWithIdentifier:cellIdentify configuration:^(CollectionCell *cell) {
//            [cell setModel:model];
        }];
    } else {
        return [tableView fd_heightForCellWithIdentifier:rightImageCellIdentify configuration:^(CollectionCell *cell) {
//            [cell setModel:model];
        }];
    }
}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
//}

- (void)editAction: (NSNotification *)notification {
    NSString *editButtonCurrentTitle = notification.userInfo[@"buttonTitle"];
    NSLog(@"编辑");
    self.isEditing = YES;
    if ([editButtonCurrentTitle isEqualToString:@"编辑"]) {
        [self addBottomDeleteButtonView];
        [self.editButton setTitle:@"取消" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.frame = CGRectMake(20, 10, kScreenWidth + 20, kScreenHeight - 64 - 44  -10);
        }];
    } else {
        self.isEditing = NO;
        //进入编辑状态
//        [self.tableView setEditing:NO animated:YES];
        [self.bottomView removeFromSuperview];
        self.bottomView = nil;
        self.tableView.frame = CGRectMake(0, 10, kScreenWidth, kScreenHeight - 64 - 10);
        [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.frame = CGRectMake(-20, 10, kScreenWidth + 20, kScreenHeight - 64 - 10);
        }];
    }
}

#pragma mark - CollectCellDelegate
- (void)selectButtonDidClick:(NSIndexPath *)indexPath withButton:(UIButton *)button {
    CollectModel *model = self.dataArray[indexPath.row];
    model.isSelected = !model.isSelected;
    if (model.isSelected) {
        [self.selectedArray addObject:model];
    } else {
        [self.selectedArray removeObject:model];
    }
    NSLog(@"selectArray.count -- %ld", self.selectedArray.count);
    [self.tableView reloadData];
}

- (void)deleteAction {
    NSLog(@"删除");
    if (self.selectedArray.count == 0 || self.dataArray.count == 0) {
        return;
    }
    for (NSInteger i = 0; i < self.selectedArray.count; i++) {
        for (NSInteger j = 0; j < self.dataArray.count; j++) {
            CollectModel *model = self.selectedArray[i];
            CollectModel *dataModel = self.dataArray[j];
            if ([model.ID isEqualToString:dataModel.ID ]) {
                [self.dataArray removeObject:dataModel];
            }
        }
    }
    self.isEditing = NO;
    // 当删除完成之后进行完成状态
    [self editAction:nil];
    [self.tableView reloadData];
}

- (void)addProgressView {
    UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(10, 100, 300, 30)];
    progressView.backgroundColor = [UIColor grayColor];
    progressView.transform = CGAffineTransformMakeScale(1.0f, 10.0f);    // 设置高度
    progressView.progressTintColor = [UIColor orangeColor];  // 已走过的颜色
    progressView.trackTintColor = [UIColor whiteColor];  // 没走过的颜色
    progressView.progress = 0.8; // 进度 默认为0.0∈[0.0,1.0]
    progressView.layer.cornerRadius = 8;
    progressView.layer.masksToBounds = YES;
    progressView.progressImage = [UIImage imageNamed:@"left.png"];
    progressView.trackImage = [UIImage imageNamed:@"right.png"];
    [self.view addSubview:progressView];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
