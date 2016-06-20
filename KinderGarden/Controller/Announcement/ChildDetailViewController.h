//
//  ChildDetailViewController.h
//  KinderGarden
//
//  Created by haonanchen on 16/6/11.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface ChildDetailViewController : BasicViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray * infoArray;

    UITableView * infoTable;
    
    NSString * descString;
}

@end
