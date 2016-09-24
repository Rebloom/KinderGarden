//
//  SecondViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import "SchoolCell.h"

@interface SecondViewController : BasicViewController<UITableViewDelegate,UITableViewDataSource,dynamicDelegate>
{
    UIButton * announceBtn;
    UIButton * babyShowBtn;
    NSString * statusFlag; //用来记录公告栏和宝宝秀状态
    NSString * announceFlag;//用来记录公告栏下三种状态

    UIView * headView;
    UITableView * infoTableView;
    
    UIButton * schoolBtn;
    UIButton * classBtn;
    UIButton * tipBtn;
    
    NSMutableArray * infoArray;
}
@end
