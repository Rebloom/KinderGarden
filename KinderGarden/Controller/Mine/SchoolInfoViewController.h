//
//  SchoolInfoViewController.h
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/19.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface SchoolInfoViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate, UIAlertViewDelegate,UIActionSheetDelegate>
{
    UITableView * infoTableView;
    
    NSMutableArray * leftArray;
    NSMutableArray * rightArray;
}


@end
