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
#import "ClassManageViewController.h"
#import "TeatcherManageViewController.h"

@interface SchoolInfoViewController ()

@end

@implementation SchoolInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;
    
    [headerView loadComponentsWithTitle:@"学校信息" withTitleColor:KBlackColor];
    [headerView setBackgroundColor:KFontColorA];
    [headerView backButton];
    
    leftArray = [NSMutableArray array];
    rightArray = [NSMutableArray array];
    
    NSArray * titleArr = @[@"职务",@"权限",@"加入学校",@"建立班级",@"老师管理",@"班级管理",@"离开幼儿园"];
    NSArray * contentArr = @[@"园长",@"管理员",@"",@"",@"",@"",@""];
    
    for (NSString * str in titleArr)
    {
        [leftArray addObject:str];
    }
    for (NSString * rStr in contentArr)
    {
        [rightArray addObject:rStr];
    }
    
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
    
    cell.nameLabel.text = [leftArray objectAtIndex:indexPath.row];
    
    cell.rightLabel.frame = CGRectMake(screenWidth-180, 0, 150, 45);
    cell.rightLabel.text = [rightArray objectAtIndex:indexPath.row];
    
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
        UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"管理员",@"普通老师",@"网站管理员",@"保育员老师", nil];
        sheet.tag = indexPath.row;
        [sheet showInView:self.view];
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
        TeatcherManageViewController * TMVC = [[TeatcherManageViewController alloc] init];
        [self pushToViewController:TMVC];
    }
    else if (indexPath.row == 5)
    {
        ClassManageViewController * CMVC = [[ClassManageViewController alloc] init];
        [self pushToViewController:CMVC];
    }
    else if (indexPath.row == 6)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确认离校" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"取消"];
    }
    else
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"正在确认离开..."];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 1)
    {
        NSArray * nameArr = @[@"管理员",@"普通老师",@"网站管理员",@"保育员老师"];
        if (buttonIndex < 4)
        {
            [rightArray replaceObjectAtIndex:1 withObject:[nameArr objectAtIndex:buttonIndex]];
        }
        [infoTableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
