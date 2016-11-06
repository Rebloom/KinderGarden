//
//  SearchSchoolViewController.m
//  KinderGarden
//
//  Created by Rebloom on 16/10/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "SearchSchoolViewController.h"

@implementation SearchSchoolViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [headerView loadComponentsWithTitle:@"选择学校"];
    
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), screenWidth, 45)];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(searchBar.frame), SCREEN_WIDTH, SCREEN_HEIGHT-64-CGRectGetHeight(searchBar.frame))];
    infoTable.delegate = self;
    infoTable.dataSource = self;
    [self.view addSubview:infoTable];
    
    schoolInfoArray = @[@"汇佳幼儿园",@"育才幼儿园"];
    classInfoArray = @[@"加入大一班",@"加入大二班",@"加入大三班"];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return schoolInfoArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return classInfoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 50)];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, screenWidth-20, 50)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = BoldFontWithSize(16);
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = [schoolInfoArray objectAtIndex:section];
    
    [view addSubview:titleLabel];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 45)];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, screenWidth-30, 45)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = NormalFontWithSize(14);
    titleLabel.textColor = [UIColor darkGrayColor];
    titleLabel.text = [classInfoArray objectAtIndex:indexPath.row];
    
    [cell addSubview:titleLabel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请耐心等待老师审核！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
    
    [GFStaticData saveObject:@"YES" forKey:kTagSavedKeySelectSchool];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self back];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 180;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}


@end
