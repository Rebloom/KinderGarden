//
//  CoursesViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/28.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface CoursesViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * infoTablView;
}
@end
