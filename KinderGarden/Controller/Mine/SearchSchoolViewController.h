//
//  SearchSchoolViewController.h
//  KinderGarden
//
//  Created by Rebloom on 16/10/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface SearchSchoolViewController : BasicViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate>
{
    UITableView * infoTable;
    
    NSArray * schoolInfoArray;
    NSArray * classInfoArray;
}

@end
