//
//  MainViewController.h
//  KinderGarden
//
//  Created by Rebloom on 16/8/14.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface MainViewController : BasicViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray * infoArray;

@property (nonatomic, retain) UITableView * infoTable;

@end
