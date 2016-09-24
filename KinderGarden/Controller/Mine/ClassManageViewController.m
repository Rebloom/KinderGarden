//
//  ClassManageViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ClassManageViewController.h"
#import "AddTeatcherCell.h"

#import "ClassRequest.h"

@interface ClassManageViewController ()

@end

@implementation ClassManageViewController

- (void)createSaveBtn
{
    UIButton * saveBtn = [[UIButton alloc] init];
    [saveBtn setTitle:@"提交" forState:UIControlStateNormal];
    saveBtn.titleLabel.font = NormalFontWithSize(14);
    [saveBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [saveBtn setBackgroundImage:[[UIColor clearColor] image] forState:UIControlStateNormal];
    [saveBtn setFrame:CGRectMake(screenWidth-60, 20, 60, 40)];
    [saveBtn addTarget:self action:@selector(saveBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:saveBtn];
}

- (void)saveBtnOnClick
{
    NSLog(@"保存");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    isFirst = YES;
    selectedSection = [[NSMutableArray alloc] initWithCapacity:10];
    infoArr = [[NSMutableArray alloc] initWithCapacity:10];
    selectDict = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:@"NO" forKey:@"0"];
    [selectedSection addObject:dic];

    [headerView loadComponentsWithTitle:@"班级管理" withTitleColor:KBlackColor];
    [headerView backButton];
    [headerView setBackgroundColor:KFontColorA];

    [self createSaveBtn];
    [self createUI];
    
    [self getClassInfo];
}

- (void)getClassInfo
{
    [ClassRequest getClassListWithSchoolID:@"1" chiefTeacher:@"" delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    infoArr = [request.attributeDic objectForKey:@"obj"];
    [infoTableView reloadData];
}

- (void)nxRequestFailed:(NXBaseRequest *)request
{
    
}

- (void)createUI
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    [self.view addSubview:infoTableView];
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0.1)];
    infoTableView.tableFooterView = footView;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSDictionary * backInfo = [infoArr objectAtIndex:section];
    
    UIView * bgView = [[UIView alloc] init];
    bgView.backgroundColor = KFontColorA;
    bgView.frame = CGRectMake(0, 0, screenWidth, 45);
    
    UILabel * nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = KFontColorC;
    nameLabel.font = NormalFontWithSize(15);
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.text = [backInfo objectForKey:@"classname"];
    nameLabel.frame = CGRectMake(20, 0, 200, 45);
    [bgView addSubview:nameLabel];
    
    UIImageView * jiantouIV = [[UIImageView alloc] init];
    jiantouIV.frame = CGRectMake(screenWidth-35, 10, 25, 25);
    jiantouIV.image = [UIImage imageNamed:@"icon_youjiantou"];
    [bgView addSubview:jiantouIV];
    
    UILabel * lineLabel = [[UILabel  alloc] init];
    lineLabel.backgroundColor = KFontColorE;
    lineLabel.frame = CGRectMake(0, 44.5, screenWidth, 0.5);
    [bgView addSubview:lineLabel];
    
    UIButton * timeBtn = [[UIButton alloc] init];
    timeBtn.frame = CGRectMake(0, 0, screenWidth, 45);
    timeBtn.tag = section;
    [timeBtn setBackgroundColor:[UIColor clearColor]];
    [timeBtn addTarget:self action:@selector(timeBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:timeBtn];
    
    for (NSDictionary * dic in selectedSection)
    {
        if ([dic objectForKey:[NSString stringWithFormat:@"%d", (int)section]])
        {
            if ([[dic objectForKey:[NSString stringWithFormat:@"%d", (int)section]] isEqualToString:@"YES"])
            {
                jiantouIV.image = [UIImage imageNamed:@"icon_xiajiantou"];
            }
            else
            {
                jiantouIV.image = [UIImage imageNamed:@"icon_youjiantou"];
            }
        }
    }
    
    return bgView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return infoArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    for (NSDictionary * dic in selectedSection)
    {
        if ([dic objectForKey:[NSString stringWithFormat:@"%d", (int)section]])
        {
            if ([[dic objectForKey:[NSString stringWithFormat:@"%d", (int)section]] isEqualToString:@"YES"])
            {
                return 10;
            }
            else
            {
                return 0;
            }
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (NSDictionary * dic in selectedSection)
    {
        if ([dic objectForKey:[NSString stringWithFormat:@"%d", (int)indexPath.section]])
        {
            if ([[dic objectForKey:[NSString stringWithFormat:@"%d", (int)indexPath.section]] isEqualToString:@"YES"])
            {
                if(infoArr.count > indexPath.row)
                {
                    return 60;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }
    }
    
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * addCellID = @"addID";
    AddTeatcherCell * cell = [tableView dequeueReusableCellWithIdentifier:addCellID];
    if (cell == nil)
    {
        cell = [[AddTeatcherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addCellID];
    }
    
    
    cell.nameLabel.text = [infoArr objectAtIndex:indexPath.row];
    
    cell.selectImageView.image = [UIImage imageNamed:@"teatcherChat"];
    cell.selectImageView.frame = CGRectMake(screenWidth-20-12, 21, 20, 19);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

// 根据时间段请求，点击即取消当前页其它请求
- (void)timeBtnOnClick:(UIButton *)sender
{
//    selectedIndex = sender.tag;
//    
//    BOOL needAdd = YES;
//    for (NSMutableDictionary * dic in selectedSection)
//    {
//        if ([dic objectForKey:[NSString stringWithFormat:@"%d", (int)selectedIndex]])
//        {
//            needAdd = NO;
//            if ([[dic objectForKey:[NSString stringWithFormat:@"%d", (int)selectedIndex]] isEqualToString:@"YES"])
//            {
//                [dic setObject:@"NO" forKey:[NSString stringWithFormat:@"%d", (int)selectedIndex]];
//            }
//            else
//            {
//                [dic setObject:@"YES" forKey:[NSString stringWithFormat:@"%d", (int)selectedIndex]];
//            }
//        }
//    }
//    
//    if (needAdd)
//    {
//        NSMutableDictionary * addDic = [NSMutableDictionary dictionary];
//        [addDic setObject:@"YES" forKey:[NSString stringWithFormat:@"%d", (int)selectedIndex]];
//        [selectedSection addObject:addDic];
//    }
    [infoTableView reloadData];
}

@end
