//
//  CameraListCell.h
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/10/27.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZCameraInfo.h"

@interface CameraListCell : UITableViewCell
{
    EZCameraInfo *_cameraInfo;
}

@property (nonatomic, weak) IBOutlet UIImageView *cameraImageView;
@property (nonatomic, weak) IBOutlet UIButton *playButton;
@property (nonatomic, weak) IBOutlet UIButton *recordButton;
@property (nonatomic, weak) IBOutlet UIButton *messageButton;
@property (nonatomic, weak) IBOutlet UIButton *settingButton;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *offlineIcon;
@property (nonatomic, weak) UIViewController *parentViewController;

- (void)setCameraInfo:(EZCameraInfo *)cameraInfo;

@end
