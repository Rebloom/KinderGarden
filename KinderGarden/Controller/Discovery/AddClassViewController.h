//
//  AddClassViewController.h
//  KinderGarden
//
//  Created by haonanchen on 16/9/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface AddClassViewController : BasicViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView * infoTable;
    
    NSMutableArray * infoArray;
}

@end
