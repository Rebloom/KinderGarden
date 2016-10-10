//
//  EZCameraTableViewController.m
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/10/28.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import "EZCameraTableViewController.h"
#import "EZOpenSDK.h"
#import "GlobalKit.h"
#import "EZAccessToken.h"
#import "MJRefresh.h"
#import "CameraListCell.h"
#import "DDKit.h"
#import "EZLivePlayViewController.h"
#import "EZPlaybackViewController.h"
#import "EZMessageListViewController.h"
#import "EZSettingViewController.h"

#define EZCameraListPageSize 10

@interface EZCameraTableViewController ()

@property (nonatomic, strong) NSMutableArray *cameraList;
@property (nonatomic) NSInteger currentPageIndex;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *addButton;

@end

@implementation EZCameraTableViewController

@synthesize tableView;

- (void)dealloc
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HeaderView * headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
    headerView.delegate = self;
    [headerView loadComponentsWithTitle:@"在线摄像头列表"];
    [headerView backButton];
    [self.view addSubview:headerView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), screenWidth, screenHeight-CGRectGetHeight(headerView.frame))];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.tableView];
    
    if(!_cameraList)
        _cameraList = [NSMutableArray new];
    
    
    //判断本地保存的accessToken，然后向SDK设置AccessToken。
    if ([GlobalKit shareKit].accessToken)
    {
        [EZOpenSDK setAccessToken:[GlobalKit shareKit].accessToken];
        [self addRefreshKit];
    }
    else
    {
        self.navigationItem.rightBarButtonItem = nil;
        [EZOpenSDK openLoginPage:^(EZAccessToken *accessToken) {
            [[GlobalKit shareKit] setAccessToken:accessToken.accessToken];
            [EZOpenSDK setAccessToken:accessToken.accessToken];
            [self addRefreshKit];
            self.navigationItem.rightBarButtonItem = self.addButton;
        }];
        return;
    }
    
//    self.tableView.delaysContentTouches = NO;
}

- (void)buttonClicked:(id)sender
{
    if (self.navigationController && self.navigationController.viewControllers.count>1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_needRefresh)
    {
        _needRefresh = NO;
        [self.tableView.header beginRefreshing];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_cameraList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CameraListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CameraCell" forIndexPath:indexPath];
    
    // Configure the cell...
    EZCameraInfo *info = [_cameraList dd_objectAtIndex:indexPath.row];

    [cell setCameraInfo:info];
    cell.parentViewController = self;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"didSelectedRowAtIndexPath:%@", indexPath);
//    EZCameraInfo *info = [_cameraList dd_objectAtIndex:indexPath.row];
//    [self performSegueWithIdentifier:@"go2LivePlay" sender:info];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
    }
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 73.0 * [UIScreen mainScreen].bounds.size.width/320.0f;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    EZCameraInfo *camera = sender;
    if ([[segue destinationViewController] isKindOfClass:[EZLivePlayViewController class]]) {
        ((EZLivePlayViewController *)[segue destinationViewController]).cameraId = camera.cameraId;
        ((EZLivePlayViewController *)[segue destinationViewController]).cameraName = camera.cameraName;
        ((EZLivePlayViewController *)[segue destinationViewController]).deviceSerial = camera.deviceSerial;
    }
    else if ([[segue destinationViewController] isKindOfClass:[EZPlaybackViewController class]]) {
        ((EZPlaybackViewController *)[segue destinationViewController]).cameraId = camera.cameraId;
        ((EZPlaybackViewController *)[segue destinationViewController]).deviceSerial = camera.deviceSerial;
        ((EZPlaybackViewController *)[segue destinationViewController]).cameraName = camera.cameraName;
    }
    else if ([[segue destinationViewController] isKindOfClass:[EZMessageListViewController class]]) {
        ((EZMessageListViewController *)[segue destinationViewController]).cameraId = camera.cameraId;
        ((EZMessageListViewController *)[segue destinationViewController]).deviceSerial = camera.deviceSerial;

    }
    else if ([[segue destinationViewController] isKindOfClass:[EZSettingViewController class]]) {
        ((EZSettingViewController *)[segue destinationViewController]).cameraInfo = camera;
    }
}

#pragma mark - Custom Methods

- (void)addRefreshKit
{
    __weak typeof(self) weakSelf = self;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.currentPageIndex = 0;
        //获取设备列表接口
        [EZOpenSDK getCameraList:weakSelf.currentPageIndex++
                        pageSize:EZCameraListPageSize
                      completion:^(NSArray *cameraList, NSError *error) {
                          NSLog(@"cameraList: %@ error: %@", cameraList, error);
                          [weakSelf.cameraList removeAllObjects];
                          [weakSelf.cameraList addObjectsFromArray:cameraList];
                          [weakSelf.tableView reloadData];
                          [weakSelf.tableView.header endRefreshing];
                          [weakSelf addFooter];
                      }];
    }];
    self.tableView.header.automaticallyChangeAlpha = YES;
    [self.tableView.header beginRefreshing];
    
}

- (void)addFooter
{
    __weak typeof(self) weakSelf = self;
    self.tableView.footer  = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [EZOpenSDK getCameraList:weakSelf.currentPageIndex++
                        pageSize:EZCameraListPageSize
                      completion:^(NSArray *cameraList, NSError *error) {
                          if(cameraList.count == 0)
                          {
                              weakSelf.tableView.footer.hidden = YES;
                              return;
                          }
                          [weakSelf.cameraList addObjectsFromArray:cameraList];
                          [weakSelf.tableView reloadData];
                          [weakSelf.tableView.footer endRefreshing];
                      }];
    }];
}

- (IBAction)go2AddDevice:(id)sender
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        UIStoryboard *addDeviceStoryBoard = [UIStoryboard storyboardWithName:@"AddDevice" bundle:nil];
        UIViewController *rootViewController = [addDeviceStoryBoard instantiateViewControllerWithIdentifier:@"AddByQRCode"];
        UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] init];
        returnButton.title = @"";
        self.navigationItem.backBarButtonItem = returnButton;
        [self.navigationController pushViewController:rootViewController animated:YES];
    }
    else
    {
        [UIView dd_showMessage:@"iOS 7.0以下扫码功能请自行实现"];
    }
}

- (void)go2Play:(EZCameraInfo *)camera
{
    NSLog(@"tap go 2 live play");
    [self performSegueWithIdentifier:@"go2LivePlay" sender:camera];
}

- (void)go2Record:(EZCameraInfo *)camera
{
    [self performSegueWithIdentifier:@"go2Playback" sender:camera];
}

- (void)go2Setting:(EZCameraInfo *)camera
{
    [self performSegueWithIdentifier:@"go2Setting" sender:camera];
}

- (void)go2Message:(EZCameraInfo *)camera
{
    [self performSegueWithIdentifier:@"go2MessageList" sender:camera];
}

@end
