//
//  AddTeatcherViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "AddTeatcherViewController.h"
#import "AddTeatcherCell.h"

@interface AddTeatcherViewController ()

@end

@implementation AddTeatcherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;
    
    selectDict = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    [headerView setBackgroundColor:KFontColorA];
    [headerView loadComponentsWithTitle:@"添加老师" withTitleColor:KBlackColor];
    [headerView backButton];
    
    [self createUI];
}

- (void)createUI
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.bounces = NO;//禁止tableView弹性效果
    [self.view addSubview:infoTableView];
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 45)];
    
    UIButton * commitBtn = [[UIButton alloc] init];
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    [commitBtn setBackgroundImage:[KPurpleColor image] forState:UIControlStateNormal];
    [commitBtn setFrame:CGRectMake(0, 0, screenWidth, 45)];
    [commitBtn addTarget:self action:@selector(commitBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:commitBtn];
    
    return footView;
}

- (void)commitBtnOnClick
{
    NSLog(@"提交");
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 45.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
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
    
    
    NSArray * tempArr= @[@"小A",@"豆豆",@"妞妞",@"贝贝娜",@"萌萌",@"妞妞",@"赵子轩",@"豆豆",@"妞妞",@"老师",@"小A",@"豆豆",@"妞妞",@"贝贝娜",@"萌萌"];
    
    cell.nameLabel.text = [tempArr objectAtIndex:indexPath.row];
    cell.selectImageView.image = [UIImage imageNamed:@"select"];
    cell.selectImageView.frame = CGRectMake(screenWidth-20-12, 22.5, 20, 15);
  
    NSString * isSe = [selectDict objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];

    if ([isSe isEqualToString:@"YES"])
    {
        cell.selectImageView.hidden = NO;
    }
    else
    {
        cell.selectImageView.hidden = YES;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSString * isSe = [selectDict objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
    if ([isSe isEqualToString:@"YES"])
    {
        [selectDict setObject:@"NO" forKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    }
    else
    {
        [selectDict setObject:@"YES" forKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    }
    
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
