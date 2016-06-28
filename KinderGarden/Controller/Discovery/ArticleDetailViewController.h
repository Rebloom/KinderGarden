//
//  ArticleDetailViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import "ArticleDetailHeaderView.h"
#import "ArticleDetailCell.h"

@interface ArticleDetailViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate,ArticleDetailHeaderDelegate>
{
    UITableView * infoTableView;
    
}
@property(nonatomic,strong)ArticleDetailHeaderView * adHeaderView;
@end
