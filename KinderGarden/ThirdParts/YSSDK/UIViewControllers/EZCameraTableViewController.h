//
//  EZCameraTableViewController.h
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/10/28.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HeaderView.h"

@interface EZCameraTableViewController : UIViewController <HeaderViewDelegate>

@property (nonatomic) BOOL needRefresh;

@property (nonatomic, strong) UITableView * tableView;

@end
