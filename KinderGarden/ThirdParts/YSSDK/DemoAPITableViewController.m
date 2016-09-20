//
//  DemoAPITableViewController.m
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/11/24.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "DemoAPITableViewController.h"
#import "EZOpenSDK.h"
#import "EZSquareChannel.h"
#import "EZSquareVideo.h"
#import "EZFavoriteSquareVideo.h"
#import "EZCheckFavoriteSquareVideo.h"
#import "DDKit.h"
#import "EZLeaveMessage.h"
#import "GlobalKit.h"
#import "EZDeviceInfo.h"
#import "EZUserInfo.h"
#import "EZAccessToken.h"
#import "EZStorageInfo.h"
#import "EZCameraInfo.h"
#import "EZDetectorInfo.h"
#import "EZPushService.h"
#import "EZStartPushParameter.h"
#import "EZLivePlayViewController.h"
#import "EZPlayDemoViewController.h"

@interface DemoAPITableViewController ()
{
    NSInteger _i;
    NSString *_cameraId;
}

@property (nonatomic, strong) NSMutableArray *apis;
@property (nonatomic, strong) NSMutableArray *columns;
@property (nonatomic, strong) NSMutableArray *videoList;
@property (nonatomic, strong) NSMutableArray *favorites;
@property (nonatomic, strong) NSMutableArray *leaveList;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation DemoAPITableViewController

- (void)dealloc
{
    NSLog(@"%@ dealloc", self.class);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"DemoAPI";
    
    if(!_apis)
        _apis = [NSMutableArray new];
    
    if(!_columns)
        _columns = [NSMutableArray new];
    
    if(!_videoList)
        _videoList = [NSMutableArray new];
    
    if(!_favorites)
        _favorites = [NSMutableArray new];
    
    if (!_leaveList) {
        _leaveList = [NSMutableArray new];
    }
    
    [_apis removeAllObjects];
    [_apis addObjectsFromArray:@[@"视频广场类别",@"视频广场视频列表",@"检查收藏",@"收藏视频",@"我的收藏列表",@"取消收藏"]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //判断本地保存的accessToken，然后向SDK设置AccessToken。
    if([GlobalKit shareKit].accessToken)
    {
        [EZOpenSDK setAccessToken:[GlobalKit shareKit].accessToken];
    }
    else
    {
        [EZOpenSDK openLoginPage:^(EZAccessToken *accessToken) {
            [[GlobalKit shareKit] setAccessToken:accessToken.accessToken];
            [EZOpenSDK setAccessToken:accessToken.accessToken];
        }];
        return;
    }
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
    return self.apis.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoAPICell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _apis[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            [EZOpenSDK getSquareChannelList:^(NSArray *squareColumns, NSError *error) {
                NSLog(@"squareColumns = %@", squareColumns);
                [self.columns removeAllObjects];
                [self.columns addObjectsFromArray:squareColumns];
            }];
        }
            break;
        case 1: {
            if (self.columns.count == 0)
            {
                NSIndexPath *doSelectedIndexPath = [NSIndexPath indexPathForItem:indexPath.row-1 inSection:indexPath.section];
                [tableView deselectRowAtIndexPath:doSelectedIndexPath animated:YES];
                return;
            }
            EZSquareChannel *channel = [self.columns dd_objectAtIndex:rand() % self.columns.count];
            [EZOpenSDK getSquareVideoList:channel.id
                                pageIndex:0 pageSize:10 completion:^(NSArray *videoList, NSInteger totalCount, NSError *error) {
                NSLog(@"videoList = %@, totalCount = %d", videoList, (int)totalCount);
                [self.videoList removeAllObjects];
                [self.videoList addObjectsFromArray:videoList];
            }];
        }
            break;
        case 2: {
            if(self.videoList.count == 0)
            {
                NSIndexPath *doSelectedIndexPath = [NSIndexPath indexPathForItem:indexPath.row-1 inSection:indexPath.section];
                [tableView deselectRowAtIndexPath:doSelectedIndexPath animated:YES];
                return;
            }
            EZSquareVideo *video = [self.videoList dd_objectAtIndex:rand() % self.videoList.count];
            [EZOpenSDK checkFavorite:@[video.id] completion:^(NSArray *checkFavorites, NSError *error) {
                NSLog(@"check favorite result = %@, error = %@", checkFavorites, error);
            }];
        }
            break;
            
        case 3: {
            if (self.videoList.count == 0)
            {
                NSIndexPath *doSelectedIndexPath = [NSIndexPath indexPathForItem:indexPath.row-1 inSection:indexPath.section];
                [tableView deselectRowAtIndexPath:doSelectedIndexPath animated:YES];
                return;
            }
            EZSquareVideo *video = [self.videoList dd_objectAtIndex:rand() % self.videoList.count];
            [EZOpenSDK saveFavorite:[NSString stringWithFormat:@"%@",video.id] completion:^(id result, NSError *error) {
                NSLog(@"save favorite result = %@, error = %@", result, error);
            }];
        }
            break;
        case 4: {
            [EZOpenSDK getFavoriteSquareVideoList:0 pageSize:10 completion:^(NSArray *favorites, NSInteger totalCount, NSError *error) {
                NSLog(@"favorites = %@, totalCount = %d", favorites, (int)totalCount);
                [self.favorites removeAllObjects];
                [self.favorites addObjectsFromArray:favorites];
            }];
        }
            break;
        case 5:{
            if (self.favorites.count == 0)
            {
                NSIndexPath *doSelectedIndexPath = [NSIndexPath indexPathForItem:indexPath.row-1 inSection:indexPath.section];
                [tableView deselectRowAtIndexPath:doSelectedIndexPath animated:YES];
                return;
            }
            EZFavoriteSquareVideo *video = [self.favorites dd_objectAtIndex:rand() % self.videoList.count];
            [EZOpenSDK cancelFavorite:video.id completion:^(NSError *error) {
                NSLog(@"cancel favorite error = %@", error);
            }];
        }
            break;
        default:
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
//    EZPlayDemoViewController *liveVC = [segue destinationViewController];
//    liveVC.cameraId = @"c817c1de002e4d95876539d539adaf28";
//    EZSquareVideo *video = [self.videoList dd_objectAtIndex:rand() % self.videoList.count];
//    
//    liveVC.cameraList = @[@"206213c524ed47288b52368336018881",
//                          @"d80ff5b583d247f08414d8ce3a7c4cf2",
//                          @"6faff0e0daff408988660cdcd512ab74"];
}

- (IBAction)checkCancel:(id)sender {
    __weak typeof(self) weakSelf = self;
    [EZOpenSDK openChangePasswordPage:^(NSInteger resultCode) {
        NSLog(@"resultCode = %d", (int)resultCode);
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}

@end
