//
//  LookViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import "LookCell.h"

@interface LookViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,LookCellDelegate>
{
    UITableView * infoTableView;
    UIButton * attentionBtn;
    UIButton * funsBtn;
    
    NSString * statusFlag;//用来记录我的关注和我的粉丝状态
    NSMutableArray * infoArr;
}


@end
