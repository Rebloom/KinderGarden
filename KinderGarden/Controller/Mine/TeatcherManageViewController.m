//
//  TeatcherManageViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "TeatcherManageViewController.h"
#import "AddTeatcherCell.h"
#import "TeatcherInfoViewController.h"

#import "UserRequest.h"

@interface TeatcherManageViewController ()

@end

@implementation TeatcherManageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;
    
    selectDict = [[NSMutableDictionary alloc] initWithCapacity:10];

    [headerView loadComponentsWithTitle:@"老师管理" withTitleColor:KBlackColor];
    [headerView backButton];
    [headerView setBackgroundColor:KFontColorA];

    [self createUI];
    
    [UserRequest requestTeacherListWithSchoolID:@"1" classID:@"1" delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    if ([request.vrCodeString isEqualToString:kRequestTagGetTeacherList])
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"查询教师列表成功"];
        infoArray = [NSMutableArray arrayWithArray:[request.attributeDic objectForKey:@"obj"]];
        
        [infoTableView reloadData];
    }
}

- (void)createUI
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    [self.view addSubview:infoTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return infoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * addCellID = @"addID";
    AddTeatcherCell * cell = [tableView dequeueReusableCellWithIdentifier:addCellID];
    if (cell == nil)
    {
        cell = [[AddTeatcherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addCellID];
    }
    
    NSDictionary * dic = [infoArray objectAtIndex:indexPath.row];
    cell.nameLabel.text = [NXGlobalUtil checkNullData:dic key:@"teachername"];
    cell.selectImageView.image = [UIImage imageNamed:@"teatcherChat"];
    cell.selectImageView.frame = CGRectMake(screenWidth-20-12, 21, 20, 19);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TeatcherInfoViewController * TIVC = [[TeatcherInfoViewController alloc] init];
    NSDictionary * dic = [infoArray objectAtIndex:indexPath.row];
    TIVC.teacherInfo = dic;
    [self pushToViewController:TIVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
