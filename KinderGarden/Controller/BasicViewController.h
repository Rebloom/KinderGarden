//
//  BasicViewController.h
//  KinderGarden
//
//  Created by 孤星之殇 on 15/8/17.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "HeaderView.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"

#import "UIImage+UIColor.h"
#import "NSString+UIColor.h"
#import "NSTimer+Addition.h"
#import "TKAlertCenter.h"
#import "MBProgressHUD.h"

#import "NXRequestManager.h"

#import "YYKit.h"

@interface BasicViewController : UIViewController<HeaderViewDelegate,UIAlertViewDelegate,NXRequestDelegate>
{
    HeaderView * headerView;
}

//从右侧划入
- (void)pushToViewController:(BasicViewController *)controller;

- (void)presentViewController:(BasicViewController *)controller;

- (void)showAlertWithMessage:(NSString *)msg;

- (void)back;

@end