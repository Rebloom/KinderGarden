//
//  MainViewController.m
//  KinderGarden
//
//  Created by Rebloom on 16/8/14.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "MainViewController.h"

#import "FirstViewController.h"
#import "CookbookViewController.h"
#import "CoursesViewController.h"
#import "ParentsChatViewController.h"
#import "ChildListViewController.h"

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _infoArray = [[NSMutableArray alloc] init];
    [_infoArray addObject:@"视频公开课"];
    [_infoArray addObject:@"安全接送"];
    [_infoArray addObject:@"饮食"];
    [_infoArray addObject:@"课程表"];
    [_infoArray addObject:@"父母圈"];
    [_infoArray addObject:@"宝宝档案"];
    [_infoArray addObject:@"在线讲堂"];
    [_infoArray addObject:@"听吧"];
    
    headerView.frame = CGRectMake(0, 0, screenWidth, screenWidth/3*2);
    
    UIImageView * bannerImage = [[UIImageView alloc] initWithFrame:headerView.frame];
    bannerImage.image = [UIImage imageNamed:@"banner"];
    [headerView addSubview:bannerImage];

    _infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), screenWidth, screenHeight-CGRectGetMaxY(headerView.frame)-56)];
    _infoTable.delegate = self;
    _infoTable.dataSource = self;
    _infoTable.allowsSelection = NO;
    _infoTable.showsVerticalScrollIndicator = NO;
    _infoTable.showsHorizontalScrollIndicator = NO;
    _infoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_infoTable];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 180)];
    
    for (int i = 0; i < 4; i++)
    {
        UIButton * cellButton = [[UIButton alloc] initWithFrame:CGRectMake(i*screenWidth/4, 0, screenWidth/4, 60)];
        [cellButton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        cellButton.tag = indexPath.row*4+i;
        [cell addSubview:cellButton];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((screenWidth/4-48)/2, 10, 48, 48)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[_infoArray objectAtIndex:i+indexPath.row*4]]];
        imageView.userInteractionEnabled = NO;
        [cellButton addSubview:imageView];
        
        UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, screenWidth/4, 15)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.font = NormalFontWithSize(12);
        nameLabel.text = [_infoArray objectAtIndex:i+indexPath.row*4];
        [cellButton addSubview:nameLabel];
    }
    
    return cell;
}

- (void)cellBtnClicked:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    if (btn.tag == 0)
    {
        // 视频公开课
        FirstViewController * FVC = [[FirstViewController alloc] init];
        [self pushToViewController:FVC];
    }
    else if (btn.tag == 1)
    {
        
    }
    else if (btn.tag == 2)
    {
        CookbookViewController * CVC = [[CookbookViewController alloc] init];
        [self pushToViewController:CVC];
    }
    else if (btn.tag == 3)
    {
        CoursesViewController * CVC = [[CoursesViewController alloc] init];
        [self pushToViewController:CVC];
    }
    else if (btn.tag == 4)
    {
        ParentsChatViewController * PCVC = [[ParentsChatViewController alloc] init];
        [self pushToViewController:PCVC];
    }
    else if (btn.tag == 5)
    {
        ChildListViewController * CLVC = [[ChildListViewController alloc] init];
        [self pushToViewController:CLVC];
    }
}

@end
