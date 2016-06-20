//
//  ChildListViewController.h
//  KinderGarden
//
//  Created by haonanchen on 16/6/11.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

#import "ChildDetailViewController.h"

@interface ChildListViewController : BasicViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray * childArray;
    
    UITableView * infoTable;
    
    NSInteger selectedIndex;
}

@end
