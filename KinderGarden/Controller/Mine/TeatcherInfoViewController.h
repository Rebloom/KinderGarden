//
//  TeatcherInfoViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface TeatcherInfoViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
{
    UITableView * infoTableView;
    UIImageView * headView;
    UIImageView * iconView;
    UILabel * nameLabel;
    UILabel * phoneLabel;
    
    NSString * authStr;
}



@end
