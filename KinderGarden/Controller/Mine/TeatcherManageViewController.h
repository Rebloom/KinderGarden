//
//  TeatcherManageViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface TeatcherManageViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * infoTableView;
    NSMutableDictionary * selectDict;
}


@end
