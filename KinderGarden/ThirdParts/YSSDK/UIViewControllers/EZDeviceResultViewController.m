//
//  EZDeviceResultViewController.m
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/10/28.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import "EZDeviceResultViewController.h"
#import "UIImage+GIF.h"
#import "EZOpenSDK.h"
#import "EZProbeDeviceInfo.h"
#import "GlobalKit.h"
#import "DDKit.h"
#import "EZWifiConfigViewController.h"
#import "MBProgressHUD.h"

@interface EZDeviceResultViewController ()<UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *resultBackgroudImageView;
@property (nonatomic, weak) IBOutlet UIImageView *resultImageView;
@property (nonatomic, weak) IBOutlet UIImageView *noWifiImageView;
@property (nonatomic, weak) IBOutlet UIButton *actionButton;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;

@end

@implementation EZDeviceResultViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"结果";
    
    self.resultBackgroudImageView.hidden = YES;
    self.statusLabel.hidden = YES;
    self.actionButton.hidden = YES;
    
    [self doSearchDevice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue destinationViewController] isKindOfClass:[EZWifiConfigViewController class]]) {
        ((EZWifiConfigViewController *)[segue destinationViewController]).isAddDeviceSuccessed = YES;
    }
}

#pragma mark - UIAlertViewDelgate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 0xaa && buttonIndex == 1)
    {
        [GlobalKit shareKit].deviceVerifyCode = [alertView textFieldAtIndex:0].text;
        __weak MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"正在添加，请稍候...";
        [EZOpenSDK addDevice:[GlobalKit shareKit].deviceSerialNo
                  deviceCode:[GlobalKit shareKit].deviceVerifyCode
                  completion:^(NSError *error) {
                      [hud hide:YES];
                      [self handleTheError:error];
                  }];
    }
    else if (alertView.tag == 0xbb && buttonIndex == 1)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入设备验证码" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
        alertView.tag = 0xaa;
        [alertView show];
    }
}

#pragma mark - Action Methods

- (IBAction)nextAction:(id)sender
{
    if([self.actionButton.titleLabel.text isEqualToString:@"连接网络"])
    {
        [self performSegueWithIdentifier:@"go2WifiTips" sender:nil];
    }
    else if([self.actionButton.titleLabel.text isEqualToString:@"添加"])
    {
        if([GlobalKit shareKit].deviceVerifyCode != nil)
        {
            __weak MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText = @"正在添加，请稍候...";
            [EZOpenSDK addDevice:[GlobalKit shareKit].deviceSerialNo
                      deviceCode:[GlobalKit shareKit].deviceVerifyCode
                      completion:^(NSError *error) {
                          [hud hide:YES];
                          [self handleTheError:error];
                      }];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入设备验证码" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
            alertView.tag = 0xaa;
            [alertView show];
        }
    }
    else
    {
        [self doSearchDevice];
    }
}

- (void)doSearchDevice
{
    
    NSString *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:@"query_loading" ofType:@"gif"];
    
    NSData *imageData = [NSData dataWithContentsOfFile:filePath];
    self.resultImageView.image = [UIImage sd_animatedGIFWithData:imageData];
    
    self.resultBackgroudImageView.hidden = YES;
    self.resultImageView.hidden = NO;
    self.actionButton.hidden = YES;
    self.noWifiImageView.hidden = YES;
    
    self.resultLabel.text = @"正在查询设备信息，请稍后...";

    [EZOpenSDK probeDeviceInfo:[GlobalKit shareKit].deviceSerialNo
                    completion:^(EZProbeDeviceInfo *deviceInfo, NSError *error) {
                        NSLog(@"deviceInfo = %@, error = %@", deviceInfo, error);
                        self.resultBackgroudImageView.hidden = NO;
                        self.resultImageView.image = [UIImage imageNamed:@"device_default"];
                        self.resultLabel.text = [GlobalKit shareKit].deviceSerialNo;
                        if (deviceInfo)
                        {
                            self.actionButton.hidden = NO;
                            [self.actionButton setTitle:@"添加" forState:UIControlStateNormal];
                        }
                        else if (error.code == EZ_HTTPS_DEVICE_ADDED_MYSELF)
                        {
                            self.statusLabel.textColor = [UIColor blackColor];
                            self.statusLabel.text = @"您已添加过此设备";
                            self.statusLabel.hidden = NO;
                        }
                        else if (error.code == EZ_HTTPS_DEVICE_ONLINE_IS_ADDED ||
                                 error.code == EZ_HTTPS_DEVICE_OFFLINE_IS_ADDED)
                        {
                            self.statusLabel.textColor = [UIColor blackColor];
                            self.statusLabel.text = @"此设备已被别人添加";
                            self.statusLabel.hidden = NO;
                        }
                        else if (error.code == EZ_HTTPS_DEVICE_OFFLINE_NOT_ADDED ||
                                 error.code == EZ_HTTPS_DEVICE_NOT_EXISTS)
                        {
                            self.statusLabel.hidden = NO;
                            self.actionButton.hidden = NO;
                            [self.actionButton setTitle:@"连接网络" forState:UIControlStateNormal];
                        }
                        else
                        {
                            self.resultLabel.text = @"查询失败，网络不给力";
                            self.noWifiImageView.hidden = NO;
                            self.resultBackgroudImageView.hidden = YES;
                            self.resultImageView.hidden = YES;
                            self.actionButton.hidden = NO;
                            [self.actionButton setTitle:@"重试" forState:UIControlStateNormal];
                        }
                    }];

}

- (void)handleTheError:(NSError *)error
{
    if (!error)
    {
        [self performSegueWithIdentifier:@"go2WifiResult" sender:nil];
        return;
    }
    if (error.code == 105002) {
        UIAlertView *retryAlertView = [[UIAlertView alloc] initWithTitle:@"验证码错误" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重试", nil];
        retryAlertView.tag = 0xbb;
        [retryAlertView show];
    }
    else if (error.code == 105000)
    {
        [UIView dd_showMessage:@"设备已被自己添加"];
    }
    else if (error.code == 105001)
    {
        [UIView dd_showMessage:@"设备已被别人添加"];
    }
}

@end
