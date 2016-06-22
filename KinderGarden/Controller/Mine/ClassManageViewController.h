//
//  ClassManageViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface ClassManageViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * infoTableView;
    NSMutableDictionary * selectDict;
    
    BOOL isFirst;
    NSMutableArray * selectedSection;
    NSMutableArray * infoArr;
    NSInteger selectedIndex;

}


@end
