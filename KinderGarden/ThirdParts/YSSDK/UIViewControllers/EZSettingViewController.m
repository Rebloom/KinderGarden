//
//  EZSettingViewController.m
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/11/10.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import "EZSettingViewController.h"
#import "DDKit.h"
#import "MBProgressHUD.h"
#import "Masonry.h"
#import "EZOpenSDK.h"
#import "EZCameraTableViewController.h"
#import "EZEditViewController.h"
#import "EZDeviceVersion.h"
#import "EZDeviceUpgradeViewController.h"
#import "EZStorageInfo.h"

@interface EZSettingViewController ()<UIActionSheetDelegate>

@property (nonatomic, strong) NSMutableArray *settingList;
@property (nonatomic, weak) IBOutlet UISwitch *videoSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *actionSwitch;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *serialLabel;
@property (nonatomic, weak) IBOutlet UILabel *currentVersionLabel;
@property (nonatomic, weak) IBOutlet UILabel *nVersionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *updateImageView;
@property (nonatomic, strong) EZDeviceVersion *deviceVersion;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation EZSettingViewController

- (void)dealloc
{
//    [[EzvizDeviceManager sharedManager] stopP2PHolePunching:_cameraInfo.cameraId];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设备设置";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if (!_settingList)
        _settingList = [NSMutableArray new];
    [_settingList addObject:@[@"设备名"]];
    [_settingList addObject:@[@"序列号"]];
    [_settingList addObject:@[@"当前版本",@"最新版本"]];
    [_settingList addObject:@[@"活动检测提醒"]];
    [_settingList addObject:@[@"视频图片加密"]];
    [_settingList addObject:@[@"删除"]];
    
    self.serialLabel.text = self.cameraInfo.deviceSerial;
    self.actionSwitch.on = self.cameraInfo.isDefence;
    self.videoSwitch.on = self.cameraInfo.isEncrypt;
    
    self.updateImageView.hidden = YES;
    [EZOpenSDK getDeviceVersion:self.cameraInfo.deviceSerial
                     completion:^(EZDeviceVersion *version, NSError *error) {
                         _deviceVersion = version;
                         self.currentVersionLabel.text = version.currentVersion;
                         if(version.isNeedUpgrade)
                         {
                             self.nVersionLabel.text = version.latestVersion;
                             self.updateImageView.hidden = NO;
                         }
                         else
                         {
                             self.updateImageView.hidden = YES;
                             self.nVersionLabel.text = version.currentVersion;
                         }
                     }];
//    [[EzvizDeviceManager sharedManager] startP2PHolePunching:_cameraInfo.cameraId completion:^(BOOL result, NSError *error) {
//        NSLog(@"result = %d, error = %@", result, error);
//    }];
    
//    [EZOpenSDK getStorageStatus:self.cameraInfo.deviceSerial
//                     completion:^(NSArray *storageStatus, NSError *error) {
//                         NSLog(@"storageStatus = %@, error = %@", storageStatus, error);
//                         EZStorageInfo *info = storageStatus[0];
//                         [EZOpenSDK formatStorage:self.cameraInfo.deviceSerial
//                                     storageIndex:info.index
//                                       completion:^(NSError *error) {
//                                           NSLog(@"format command error = %@", error);
//                                           if (!error || error.code == 120016)
//                                           {
//                                               [self checkStorageStatus:nil];
//                                           }
//                                       }];
//                     }];
}

//- (IBAction)checkStorageStatus:(id)sender
//{
//    [EZOpenSDK getStorageStatus:self.cameraInfo.deviceSerial
//                     completion:^(NSArray *storageStatus, NSError *error) {
//                         NSLog(@"started format, storageStatus = %@, error = %@", storageStatus, error);
//                         if (!error)
//                         {
//                             //5s获取一次升级状态
//                             if (_timer)
//                             {
//                                 [_timer invalidate];
//                                 _timer = nil;
//                             }
//                             _timer = [NSTimer scheduledTimerWithTimeInterval:5.0
//                                                                       target:self
//                                                                     selector:@selector(checkStorageStatus:)
//                                                                     userInfo:nil
//                                                                      repeats:YES];
//                         }
//                     }];
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }

    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.settingList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.settingList dd_objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EZSettingCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[_settingList dd_objectAtIndex:indexPath.section] dd_objectAtIndex:indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    if (indexPath.section == 0)
    {
        [cell.contentView addSubview:self.nameLabel];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(@140);
            make.trailing.mas_equalTo(cell.contentView.mas_trailing);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.height.mas_equalTo(@20);
        }];
        self.nameLabel.text = self.cameraInfo.deviceName;
    }
    else if (indexPath.section == 1)
    {
        [cell.contentView addSubview:self.serialLabel];
        [self.serialLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(@140);
            make.trailing.mas_equalTo(cell.contentView.mas_trailing).offset(-34);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.height.mas_equalTo(@20);
        }];
        self.serialLabel.text = self.cameraInfo.deviceSerial;
    }
    else if (indexPath.section == 5)
    {
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    else if (indexPath.section == 3)
    {
        [cell.contentView addSubview:self.actionSwitch];
        [self.actionSwitch mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(@(-17));
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(@51);
            make.height.mas_equalTo(@31);
        }];
    }
    else if (indexPath.section == 4)
    {
        [cell.contentView addSubview:self.videoSwitch];
        [self.videoSwitch mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(@(-17));
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(@51);
            make.height.mas_equalTo(@31);
        }];
    }
    else
    {
        if(indexPath.row == 0)
        {
            [cell.contentView addSubview:self.currentVersionLabel];
            [self.currentVersionLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.leading.mas_equalTo(@140);
                make.trailing.mas_equalTo(cell.contentView.mas_trailing).offset(-34);
                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
                make.height.mas_equalTo(@20);
            }];
        }
        else
        {
            [cell.contentView addSubview:self.nVersionLabel];
            [self.nVersionLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.leading.mas_equalTo(@140);
                make.trailing.mas_equalTo(cell.contentView.mas_trailing).offset(-34);
                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
                make.height.mas_equalTo(@20);
            }];
            [cell.contentView addSubview:self.updateImageView];
            [self.updateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.trailing.mas_equalTo(self.nVersionLabel.mas_leading).offset(5);
                make.centerY.mas_equalTo(self.nVersionLabel.mas_centerY);
            }];
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 5)
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:nil];
        [actionSheet showInView:self.view];
    }
    else if (indexPath.section == 0)
    {
        [self performSegueWithIdentifier:@"go2setDeviceName" sender:nil];
    }
    else if (indexPath.section == 2 && indexPath.row == 1 && self.updateImageView.hidden == NO)
    {
        [self performSegueWithIdentifier:@"go2Upgrade" sender:nil];
    }
    else if (indexPath.section == 1)
    {
        [EZOpenSDK openCloudPage:self.cameraInfo.deviceSerial];
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue destinationViewController] isKindOfClass:[EZEditViewController class]])
    {
        ((EZEditViewController *)[segue destinationViewController]).cameraInfo = self.cameraInfo;
    }
    else if ([[segue destinationViewController] isKindOfClass:[EZDeviceUpgradeViewController class]])
    {
        ((EZDeviceUpgradeViewController *)[segue destinationViewController]).deviceSerial = self.cameraInfo.deviceSerial;
        ((EZDeviceUpgradeViewController *)[segue destinationViewController]).version = self.deviceVersion;
    }
}

#pragma mark - UIActionSheetDelegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        __weak MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"正在删除，请稍候...";
        [EZOpenSDK deleteDevice:self.cameraInfo.deviceSerial completion:^(NSError *error) {
            if(!error)
            {
                [hud hide:YES];
                NSArray *viewControllers = self.navigationController.viewControllers;
                for (UIViewController *vc in viewControllers)
                {
                    if([vc isKindOfClass:[EZCameraTableViewController class]])
                    {
                        ((EZCameraTableViewController *)vc).needRefresh = YES;
                        [self.navigationController popToViewController:vc animated:YES];
                        break;
                    }
                }
            }
        }];
    }
}

#pragma mark - UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        NSString *smsCode = [alertView textFieldAtIndex:0].text;
        [EZOpenSDK setDeviceEnryptStatusEx:NO
                              deviceSerial:self.cameraInfo.deviceSerial
                              validateCode:smsCode
                                completion:^(NSError *error) {
                                    if (error)
                                    {
                                        [UIView dd_showMessage:error.localizedDescription];
                                        self.videoSwitch.on = YES;
                                    }
                                    else
                                    {
                                        self.videoSwitch.on = NO;
                                    }
                                }];
    } else {
        self.videoSwitch.on = YES;
    }
}


#pragma mark - Action Methods

- (IBAction)actionSwitchChanged:(id)sender
{
    __weak MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"正在切换，请稍候...";
    [EZOpenSDK setDefence:self.actionSwitch.on
             deviceSerial:self.cameraInfo.deviceSerial
               completion:^(NSError *error) {
                   [hud hide:YES];
                   self.cameraInfo.isDefence = self.actionSwitch.on;
               }];
}

- (IBAction)encryptChanged:(id)sender
{
    if(!self.videoSwitch.on)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"设备操作安全验证" message:@"请输入该设备的设备验证码（设备标签上的6位字母）" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alertView show];
    }
    else
    {
        [EZOpenSDK setDeviceEnryptStatusEx:YES
                              deviceSerial:self.cameraInfo.deviceSerial
                              validateCode:nil
                                completion:^(NSError *error) {
                                    if (!error)
                                    {
                                        self.videoSwitch.on = YES;
                                        self.cameraInfo.isEncrypt = YES;
                                    }
                                    else
                                    {
                                        [UIView dd_showMessage:error.localizedDescription];
                                    }
                                }];
    }
}

@end
