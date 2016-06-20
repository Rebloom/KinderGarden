//
//  SchoolInfoViewController.m
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/19.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "SchoolInfoViewController.h"
#import "FifthCell.h"
#import "BuildClassViewController.h"


@interface SchoolInfoViewController ()

@end

@implementation SchoolInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;

    [headerView loadComponentsWithTitle:@"学校信息" withTitleColor:KBlackColor];
    [headerView setBackgroundColor:KFontColorA];
    [headerView backButton];
    
    [self createTableView];
}
- (void)createTableView
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.showsVerticalScrollIndicator = NO;
    infoTableView.scrollEnabled = NO;
    [self.view addSubview:infoTableView];
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0.5)];
    footView.backgroundColor = KFontColorE;
    infoTableView.tableFooterView = footView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    
    FifthCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[FifthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSArray * titleArr = @[@"职务",@"权限",@"加入学校",@"建立班级",@"老师管理",@"班级管理",@"离开幼儿园"];
    NSArray * rightArr = @[@"园长",@"管理员",@"",@"",@"",@"",@""];
    
    cell.nameLabel.text = [titleArr objectAtIndex:indexPath.row];
    
    cell.rightLabel.frame = CGRectMake(screenWidth-180, 0, 150, 45);
    cell.rightLabel.text = [rightArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [infoTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        
    }
    else if (indexPath.row == 1)
    {
        
    }
    else if (indexPath.row == 2)
    {
        
    }
    else if (indexPath.row == 3)
    {
        BuildClassViewController * BCVC = [[BuildClassViewController alloc] init];
        [self pushToViewController:BCVC];
    }
    else if (indexPath.row == 4)
    {
        
    }
    else if (indexPath.row == 5)
    {
        
    }
    else if (indexPath.row == 6)
    {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
