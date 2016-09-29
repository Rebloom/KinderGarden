//
//  CameraListCell.m
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/10/27.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import "CameraListCell.h"
#import "DDKit.h"
#import "EZOpenSDK.h"
#import "UIImageView+WebCache.h"

@implementation CameraListCell

- (void)setCameraInfo:(EZCameraInfo *)cameraInfo
{
    _cameraInfo = cameraInfo;
    
    if (_cameraInfo.isOnline)
    {
        self.offlineIcon.hidden = YES;
    }
    else
    {
        self.offlineIcon.hidden = NO;
    }
    self.nameLabel.text = [NSString stringWithFormat:@"%@",cameraInfo.cameraName];
    [self.cameraImageView sd_setImageWithURL:[NSURL URLWithString:cameraInfo.picUrl] placeholderImageScale:nil];
    
//    [EZOpenSDK capturePicture:cameraInfo.deviceSerial channelNo:cameraInfo.channelNo completion:^(NSString *url, NSError *error) {
//        if(!error){
//            [self.cameraImageView sd_setImageWithURL:[NSURL URLWithString:url]];
//        }
//    }];
    
    self.messageButton.hidden = NO;
    self.settingButton.hidden = NO;
    if (_cameraInfo.isShared == 2)
    {
        self.messageButton.hidden = YES;
        self.settingButton.hidden = YES;
    }
    [self.contentView dd_addSeparatorWithType:ViewSeparatorTypeBottom];
}

- (IBAction)go2Play:(id)sender
{
    [self.parentViewController performSelector:@selector(go2Play:) withObject:_cameraInfo];
}

//- (IBAction)go2Record:(id)sender
//{
//    [self.parentViewController performSelector:@selector(go2Record:) withObject:_cameraInfo];
//}
//
//- (IBAction)go2Setting:(id)sender
//{
//    [self.parentViewController performSelector:@selector(go2Setting:) withObject:_cameraInfo];
//}
//
//- (IBAction)go2Message:(id)sender
//{
//    [self.parentViewController performSelector:@selector(go2Message:) withObject:_cameraInfo];
//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"touches = %@, event = %@", touches, event);
//}

@end
